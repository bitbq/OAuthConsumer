//
//  OAAsynchronousDataFetcher.m
//  OAuthConsumer
//
//  Created by Zsombor Szabó on 12/3/08.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "OAAsynchronousDataFetcher.h"

#import "OAServiceTicket.h"

@implementation OAAsynchronousDataFetcher

+ (id)asynchronousFetcherWithRequest:(OAMutableURLRequest *)aRequest delegate:(id)aDelegate didFinishSelector:(SEL)finishSelector didFailSelector:(SEL)failSelector
{
	return [[OAAsynchronousDataFetcher alloc] initWithRequest:aRequest delegate:aDelegate didFinishSelector:finishSelector didFailSelector:failSelector];
}

- (id)initWithRequest:(OAMutableURLRequest *)aRequest delegate:(id)aDelegate didFinishSelector:(SEL)finishSelector didFailSelector:(SEL)failSelector
{
	if ((self = [super init]))
	{
		request = aRequest;
		delegate = aDelegate;
		didFinishSelector = finishSelector;
		didFailSelector = failSelector;
	}
	return self;
}

- (void)start
{
    [request prepare];
	
	
	connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
	if (connection)
	{
		responseData = [[NSMutableData alloc] init];
	}
	else
	{
        OAServiceTicket *ticket= [[OAServiceTicket alloc] initWithRequest:request
                                                                 response:nil
                                                               didSucceed:NO];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [delegate performSelector:didFailSelector
                       withObject:ticket
                       withObject:nil];
#pragma clang diagnostic pop
	}
}

- (void)cancel
{
	if (connection)
	{
		[connection cancel];
		connection = nil;
	}
}


#pragma mark -
#pragma mark NSURLConnection methods

- (void)connection:(NSURLConnection *)aConnection didReceiveResponse:(NSHTTPURLResponse *)aResponse
{
	response = aResponse;
	[responseData setLength:0];
}

- (void)connection:(NSURLConnection *)aConnection didReceiveData:(NSData *)data
{
	[responseData appendData:data];
}

- (void)connection:(NSURLConnection *)aConnection didFailWithError:(NSError *)error
{
	OAServiceTicket *ticket= [[OAServiceTicket alloc] initWithRequest:request
															 response:response
														   didSucceed:NO];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
	[delegate performSelector:didFailSelector
				   withObject:ticket
				   withObject:error];
#pragma clang diagnostic pop
	
}

- (void)connectionDidFinishLoading:(NSURLConnection *)aConnection
{
	OAServiceTicket *ticket = [[OAServiceTicket alloc] initWithRequest:request
															  response:response
															didSucceed:[response statusCode] < 400];
    
    NSStringEncoding encoding = NSISOLatin1StringEncoding;
    NSString *contentType = [[response allHeaderFields][@"Content-Type"] lowercaseString];
    if (contentType && [contentType rangeOfString:@"charset=utf-8"].location != NSNotFound) {
        encoding = NSUTF8StringEncoding;
    }
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:encoding];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
	[delegate performSelector:didFinishSelector
				   withObject:ticket
				   withObject:responseString];
#pragma clang diagnostic pop
	
}

@end

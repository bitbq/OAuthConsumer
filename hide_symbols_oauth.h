#ifndef OAPREFIX
#define OAPREFIX OA_HIDDEN_
#endif

#define OAPASTER(x,y) x ## y
#define OAEVALUATOR(x,y)  OAPASTER(x,y)
#define OAP(sym) OAEVALUATOR(OAPREFIX, sym)

#define OAAsynchronousDataFetcher OAP(OAAsynchronousDataFetcher)
#define OAConsumer OAP(OAConsumer)
#define OADataFetcher OAP(OADataFetcher)
#define OAHMAC_SHA1SignatureProvider OAP(OAHMAC_SHA1SignatureProvider)
#define OAMutableURLRequest OAP(OAMutableURLRequest)
#define OAPlaintextSignatureProvider OAP(OAPlaintextSignatureProvider)
#define OARequestParameter OAP(OARequestParameter)
#define OAServiceTicket OAP(OAServiceTicket)
#define OAToken OAP(OAToken)
#define OASignatureProviding OAP(OASignatureProviding)
#define OAParameterAdditions OAP(OAParameterAdditions)
#define OAURLEncodingAdditions OAP(OAURLEncodingAdditions)
#define OABaseAdditions OAP(OABaseAdditions)

#define EstimateBas64EncodedDataSize OAP(EstimateBas64EncodedDataSize)
#define EstimateBas64DecodedDataSize OAP(EstimateBas64DecodedDataSize)
#define Base64EncodeData OAP(Base64EncodeData)
#define Base64DecodeData OAP(Base64DecodeData)
#define kBase64EncodeTable OAP(kBase64EncodeTable)
#define kBase64DecodeTable OAP(kBase64DecodeTable)
#define kBits_00000011 OAP(kBits_00000011)
#define kBits_00001111 OAP(kBits_00001111)
#define kBits_00110000 OAP(kBits_00110000)
#define kBits_00111100 OAP(kBits_00111100)
#define kBits_00111111 OAP(kBits_00111111)
#define kBits_11000000 OAP(kBits_11000000)
#define kBits_11110000 OAP(kBits_11110000)
#define kBits_11111100 OAP(kBits_11111100)

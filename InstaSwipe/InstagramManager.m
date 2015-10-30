//
//  InstagramManager.m
//  InstaSwipe
//
//  Created by edwin bosire on 18/10/2015.
//  Copyright © 2015 Edwin Bosire. All rights reserved.
//

#import "InstagramManager.h"
#import "InstagramKit.h"

#define kFetchItemsCount 15

@interface InstagramManager ()
@property (nonatomic, strong) InstagramPaginationInfo *currentPaginationInfo;
@end

@implementation InstagramManager

+ (instancetype)shared
{
	
	static id shared = nil;
	if (shared == nil) {
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			shared = [[self alloc] init];
		});
	}
	return shared;
}

- (BOOL)isSessionValid
{
	return [InstagramEngine sharedEngine].isSessionValid;
}

- (NSURL *)authenticationURL
{
	return  [[InstagramEngine sharedEngine] authorizarionURLForScope:(InstagramKitLoginScopeBasic | InstagramKitLoginScopeLikes)];
}

- (BOOL)extractTokenFromURL:(NSURL *)url
{
	NSError *error = nil;
	BOOL valid = [[InstagramEngine sharedEngine] receivedValidAccessTokenFromURL:url error:&error];
	
	if (valid && !error)
		{
		NSLog(@"Token extracted from URL");
		return YES;
		}
	else
		{
		NSLog(@"Error extracting token %@",error);
		return NO;
		}
}

- (void)retrieveFeeds:(FeedCompletionBlock)block
{
	__weak typeof(self) weakSelf = self;
	
	[[InstagramEngine sharedEngine] getSelfFeedWithCount:kFetchItemsCount
										 maxId:self.currentPaginationInfo.nextMaxId
									   success:^(NSArray *media, InstagramPaginationInfo *paginationInfo){
										   
										   weakSelf.currentPaginationInfo = paginationInfo;
										   [weakSelf.mediaArray addObjectsFromArray:media];
										   
										   block(media, nil);
									   }
									   failure:^(NSError *error, NSInteger statusCode) {
										   block(nil, error);
										   NSLog(@"Fetching feed items failed");
									   }];

}

- (void)likeMedia:(NSString *)mediaId completion:(LikeCompletionBlock)block
{
	[[InstagramEngine sharedEngine] likeMedia:mediaId
								  withSuccess:^(NSDictionary *serverResponse) {
									  block(YES);
								  } failure:^(NSError *error, NSInteger serverStatusCode) {
									  block(NO);
								  }];
}
@end

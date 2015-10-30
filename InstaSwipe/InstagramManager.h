//
//  InstagramManager.h
//  InstaSwipe
//
//  Created by edwin bosire on 18/10/2015.
//  Copyright © 2015 Edwin Bosire. All rights reserved.
//

#import <Foundation/Foundation.h>

@class InstagramKit;
typedef void(^FeedCompletionBlock)(NSArray *items, NSError *error);
typedef void(^LikeCompletionBlock) (BOOL success);
@interface InstagramManager : NSObject

@property (nonatomic, strong) NSMutableArray *mediaArray;

+ (instancetype)shared;

- (BOOL)isSessionValid;
- (NSURL *)authenticationURL;
- (BOOL)extractTokenFromURL:(NSURL *)url;

#pragma mark - Feed Retrieval

- (void)retrieveFeeds:(FeedCompletionBlock)block;

#pragma mark - Like/Pass Media

- (void)likeMedia:(NSString *)mediaId completion:(LikeCompletionBlock)block;

@end

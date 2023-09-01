//
//  BDMsgRobotContentView.h
//  bytedesk-ui
//
//  Created by 宁金鹏 on 2019/6/14.
//  Copyright © 2019 bytedesk.com. All rights reserved.
//

#import "BDMsgBaseContentView.h"

//@class BDCoreTextView;
//@class DTAttributedLabel;
//@class DTAttributedTextView;

NS_ASSUME_NONNULL_BEGIN

@interface BDMsgRobotContentView : BDMsgBaseContentView

//@property (nonatomic, strong) BDCoreTextView *kfCoreTextView;
//@property (strong, nonatomic) DTAttributedLabel *attributedLabel;
//@property (strong, nonatomic) DTAttributedTextView *kfCoreTextView;
@property (strong, nonatomic) UITextView *kfCoreTextView;

@property (nonatomic, strong) UIButton *upButton;
@property (nonatomic, strong) UIButton *downButton;

//@property (nonatomic, strong) UIButton *toAgentButton;

@property (nonatomic, strong) NSString *fileName;
@property (nonatomic, strong) NSURL *lastActionLink;
@property (nonatomic, strong) NSURL *baseURL;

@end

NS_ASSUME_NONNULL_END

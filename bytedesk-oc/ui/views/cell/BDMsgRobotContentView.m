//
//  BDMsgRobotContentView.m
//  bytedesk-ui
//
//  Created by 宁金鹏 on 2019/6/14.
//  Copyright © 2019 bytedesk.com. All rights reserved.
//

#import "BDMsgRobotContentView.h"
#import "BDUIConstants.h"
#import "BDUIUtils.h"
//#import "BDCoreTextView.h"
#import "BDUtils.h"
//#import "ZSDTCoreTextTools.h"

// TODO: 点按问题，高亮显示
@interface BDMsgRobotContentView()<UITextViewDelegate>

@end

@implementation BDMsgRobotContentView

- (instancetype)initMessageContentView {
    //
    if (self = [super initMessageContentView]) {
        
        self.userInteractionEnabled = YES;
        //
//        _kfCoreTextView = [[BDCoreTextView alloc] initWithFrame:CGRectZero];
//        _kfCoreTextView = [[DTAttributedTextView alloc] initWithFrame:CGRectZero];
        _kfCoreTextView = [[UITextView alloc] initWithFrame:CGRectZero];
        [_kfCoreTextView setBackgroundColor:[UIColor clearColor]];
        [_kfCoreTextView setDelegate:self];
        [_kfCoreTextView setEditable:NO];
        [_kfCoreTextView setShowsVerticalScrollIndicator:NO];
        [_kfCoreTextView setDataDetectorTypes:UIDataDetectorTypeAll];
//        _kfCoreTextView.linkTextAttributes = @{ NSForegroundColorAttributeName: [UIColor blueColor],
//                                                NSUnderlineColorAttributeName: [UIColor clearColor],
//                                                NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)};
//        [_kfCoreTextView setTextDelegate:self];
        _kfCoreTextView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _kfCoreTextView.userInteractionEnabled = YES;
        _kfCoreTextView.scrollEnabled = NO;
//        _kfCoreTextView.font = [UIFont systemFontOfSize:16]; // 无法修改attributed字体大小
//        _kfCoreTextView.linkTextAttributes = @{};
        [self addSubview:_kfCoreTextView];
        
        //
        _upButton = [[UIButton alloc]  initWithFrame:CGRectZero];
        _upButton.userInteractionEnabled = YES;
        [_upButton setImage:[UIImage systemImageNamed:@"hand.thumbsup" withConfiguration:[UIImageSymbolConfiguration configurationWithPointSize:25]] forState:UIControlStateNormal];
        [_upButton setImage:[UIImage systemImageNamed:@"hand.thumbsup.fill" withConfiguration:[UIImageSymbolConfiguration configurationWithPointSize:25]] forState:UIControlStateHighlighted];
        [_upButton addTarget:self action:@selector(rateUpBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:_upButton]; // 暂时隐藏，待下一版完善再发
        
        _downButton = [[UIButton alloc]  initWithFrame:CGRectZero];
        _downButton.userInteractionEnabled = YES;
        [_downButton setImage:[UIImage systemImageNamed:@"hand.thumbsdown" withConfiguration:[UIImageSymbolConfiguration configurationWithPointSize:25]] forState:UIControlStateNormal];
        [_downButton setImage:[UIImage systemImageNamed:@"hand.thumbsdown.fill" withConfiguration:[UIImageSymbolConfiguration configurationWithPointSize:25]] forState:UIControlStateHighlighted];
        [_downButton addTarget:self action:@selector(rateDownBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:_downButton]; // 暂时隐藏，待下一版完善再发
        
        // debug frames
//        [DTCoreTextLayoutFrame setShouldDrawDebugFrames:![DTCoreTextLayoutFrame shouldDrawDebugFrames]];
//        [_kfCoreTextView.attributedTextContentView setNeedsDisplay];
        //
//        _toAgentButton = [[UIButton alloc] initWithFrame:CGRectZero];
//        [_toAgentButton setTitle:@"转人工" forState:UIControlStateNormal];
//        [_toAgentButton addTarget:self action:@selector(toAgentButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:_toAgentButton];
    }
    //
    return self;
}

- (BOOL)canBecomeFirstResponder {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return YES;
}

- (void)refresh:(BDMessageModel *)data isAgent:(BOOL)agent{
    [super refresh:data isAgent:agent];
//    NSLog(@"%s, type: %@, content: %@", __PRETTY_FUNCTION__, self.model.type, self.model.content);
//    [_kfCoreTextView setText:self.model.content];
//    _kfCoreTextView.attributedString = [self getAttributedStringWithHtml:self.model.content];
//    _kfCoreTextView.shouldDrawLinks = YES;
    
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithData:[self.model.content dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
//    // NSMutableAttributedString
//    [attributedString addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} range:NSMakeRange(0, attributedString.length)];
//    [_kfCoreTextView setAttributedText:attributedString];
    [_kfCoreTextView setAttributedText:self.model.contentAttr];
    
//    if ([self.delegate respondsToSelector:@selector(shouldReloadTable)]) {
//        [self.delegate performSelector:@selector(shouldReloadTable)];
//    }

    [self setNeedsLayout];
}

- (void)layoutSubviews{
    [super layoutSubviews];
//    NSLog(@"%s", __PRETTY_FUNCTION__);
    //自适应高度
//    int width = BDScreen.width * 3 / 5;
//    [_kfCoreTextView setFrame:CGRectMake(0, 0, width, FLT_MAX)];
//    [_kfCoreTextView sizeToFit];
//    CGSize size = _kfCoreTextView.frame.size;
        
//    CGSize size = [BDUIUtils sizeOfRobotContent:self.model.content];
    CGSize size = [BDUIUtils sizeOfRobotContentAttr:self.model.contentAttr];
    UIEdgeInsets contentInsets = self.model.contentViewInsets; // UIEdgeInsetsMake(10, 13, 13, 10);
    self.model.contentSize = size;
    
    CGRect labelFrame = CGRectZero;
    CGRect bubbleFrame = CGRectZero;
    CGRect boundsFrame = CGRectZero;
    CGRect upFrame = CGRectZero;
    CGRect downFrame = CGRectZero;
    
    if (self.isAgent && [self.model isClientSystem]) {
//        NSLog(@"1. 系统消息 %s, content=%@", __PRETTY_FUNCTION__, self.model.content);
        // 系统消息
        labelFrame = CGRectMake(contentInsets.left, contentInsets.top, size.width, size.height);
        bubbleFrame = CGRectMake(0, 0, contentInsets.left + size.width + contentInsets.right + 5, contentInsets.top + size.height + contentInsets.bottom );
//        boundsFrame = CGRectMake(BDScreen.width - bubbleFrame.size.width - 55, 23, bubbleFrame.size.width,  bubbleFrame.size.height);
        boundsFrame = CGRectMake(BDScreen.width - bubbleFrame.size.width, 23, bubbleFrame.size.width,  bubbleFrame.size.height);
        
        _kfCoreTextView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;

    } else if ([self.model isSend]) {
//        NSLog(@"2. 用户自己发送的消息：%s, content=%@", __PRETTY_FUNCTION__, self.model.content);
        // 访客发送消息
        labelFrame = CGRectMake(contentInsets.left, 0, size.width, size.height);
        bubbleFrame = CGRectMake(0, 0, contentInsets.left + size.width + contentInsets.right + 5, labelFrame.size.height); // contentInsets.top + size.height + contentInsets.bottom
//        boundsFrame = CGRectMake(BDScreen.width - bubbleFrame.size.width - 55, 23, bubbleFrame.size.width,  bubbleFrame.size.height);
        boundsFrame = CGRectMake(BDScreen.width - bubbleFrame.size.width, 23, bubbleFrame.size.width,  bubbleFrame.size.height);
        //
    } else {
//        NSLog(@"3. 机器人消息：%s, content=%@, size.height: %f", __PRETTY_FUNCTION__, self.model.content, size.height);
        NSLog(@"3. 机器人消息：%s, size.height: %f", __PRETTY_FUNCTION__, size.height);
        int upDownBtnWidthHeight = 25; //
        // 机器人消息
        labelFrame = CGRectMake(contentInsets.left, 0, size.width, size.height);
        bubbleFrame = CGRectMake(0, 0, contentInsets.left + size.width + contentInsets.right, size.height);
//        boundsFrame = CGRectMake(50, 40, bubbleFrame.size.width + upDownBtnWidthHeight, size.height);
        boundsFrame = CGRectMake(0, 40, bubbleFrame.size.width + upDownBtnWidthHeight, size.height);
        // 右侧
        upFrame = CGRectMake(bubbleFrame.origin.x + bubbleFrame.size.width, bubbleFrame.origin.y, upDownBtnWidthHeight, upDownBtnWidthHeight);
        _upButton.frame = upFrame;
        // 右侧
        downFrame = CGRectMake(upFrame.origin.x, upFrame.origin.y + upFrame.size.height + 5, upDownBtnWidthHeight, upDownBtnWidthHeight);
        _downButton.frame = downFrame;
        //
        _kfCoreTextView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
//        CGRect toAgentButtonFrame = CGRectMake(labelFrame.origin.x, labelFrame.origin.y + labelFrame.size.height, 100, 20);
//        [_toAgentButton setFrame:toAgentButtonFrame];
    }
//    NSLog(@"labelFrame: x=%f, y=%f, height=%f, width=%f", labelFrame.origin.x, labelFrame.origin.y, labelFrame.size.height, labelFrame.size.width);
    self.frame = boundsFrame;
    self.bubbleImageView.frame = bubbleFrame;
    self.kfCoreTextView.frame = labelFrame;
//    [_kfCoreTextView fitToSuggestedHeight];
//    self.model.contentSize = boundsFrame.size;
    // 调试颜色
//    self.backgroundColor = [UIColor grayColor];
//    self.bubbleImageView.backgroundColor = [UIColor redColor];
//    self.kfCoreTextView.backgroundColor = [UIColor yellowColor];
//    self.upButton.backgroundColor = [UIColor blueColor];
//    self.downButton.backgroundColor = [UIColor cyanColor];
}

#pragma mark - UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction {
    
    NSLog(@"%s URL: %@", __PRETTY_FUNCTION__, URL.absoluteString);
    
    NSString *key = URL.absoluteString;
    if ([key hasPrefix:@"robot://"]) {
        NSArray *arrayWithLabel = [key componentsSeparatedByString:@"?"];
        NSString *label = [arrayWithLabel lastObject];
        label = [BDUtils decodeString:label];
        //
        NSString *keyWithoutLabel = [arrayWithLabel objectAtIndex:0];
        NSArray *arrayWithKey = [keyWithoutLabel componentsSeparatedByString:@"//"];
        key = [arrayWithKey lastObject];
        key = [NSString stringWithFormat:@"question:%@", key];
        NSLog(@"%s key: %@, label:%@", __PRETTY_FUNCTION__, key, label);
        //
        if ([self.delegate respondsToSelector:@selector(robotLinkClicked:withKey:)]) {
            [self.delegate robotLinkClicked:label withKey:key];
        }
        
    //    return YES 除了监听点击事件之外还是监听长按事件 长按弹出copy share 按钮 ，不过点击open 会跳转到应用外打开链接，
    //    return NO  只监听链接的点击事件  不监听其他事件  例如长按弹出copy share 按钮 ， 这样我们可以自定义 弹出按钮 ，然后做copy 和 应用内打开链接等操作
        return NO;
    } else {
        
        NSString *label = key;
        key = @"httplink";
        //
        if ([self.delegate respondsToSelector:@selector(robotLinkClicked:withKey:)]) {
            [self.delegate robotLinkClicked:label withKey:key];
        }

        return NO;
    }

}

#pragma mark - KFCoreTextViewDelegate

//- (void)coreTextView:(BDCoreTextView *)coreTextView receivedTouchOnData:(NSDictionary *)dict {
//    // 注意：赋值是故意的，没有错乱
//    NSString *label = [dict objectForKey:@"key"];
//    NSURL *keyUrl = [dict objectForKey:@"url"];
//    NSString *key = [keyUrl absoluteString];
//    NSLog(@"kfcoretext receivedTouchOnData: %@, key: %@, url: %@", dict, label, key);
//
//    if ([self.delegate respondsToSelector:@selector(robotLinkClicked:withKey:)]) {
//        [self.delegate robotLinkClicked:label withKey:key];
//    }
//}

#pragma mark - 转人工

//- (void)toAgentButtonClicked:(id)sender {
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//}

- (void)rateUpBtnClicked:(id)sender {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    if ([self.delegate respondsToSelector:@selector(robotRateUpBtnClicked:)]) {
        [self.delegate robotRateUpBtnClicked:self.model];
    }
}

- (void)rateDownBtnClicked:(id)sender {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    if ([self.delegate respondsToSelector:@selector(robotRateDownBtnClicked:)]) {
        [self.delegate robotRateDownBtnClicked:self.model];
    }
}


@end

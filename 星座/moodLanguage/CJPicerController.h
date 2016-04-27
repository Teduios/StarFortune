//
//  CJPicerController.h
//  星座
//
//  Created by tarena030 on 16/3/31.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LewPickerControllerDelegate;

@interface CJPicerController : UIView

@property(nonatomic, strong, readonly) UILabel * titleLabel;
@property (nonatomic, strong)__kindof UIView *pickerView;// UIPickerView or UIDatePicker
@property(nonatomic, weak) id<LewPickerControllerDelegate> delegate;

- (id)initWithDelegate:(id<LewPickerControllerDelegate>)delegate;

- (void)showInView:(UIView*)target;

- (void)setToolbarStyle:(UIBarStyle)barStyle;
@end

#pragma mark -

@protocol LewPickerControllerDelegate <NSObject>

@optional
- (BOOL)lewPickerControllerShouldOKButtonPressed:(CJPicerController *)pickerController;
- (void)lewPickerControllerDidOKButtonPressed:(CJPicerController *)pickerController;
- (void)lewPickerControllerDidCancelButtonPressed:(CJPicerController *)pickerController;
@end
NS_ASSUME_NONNULL_END


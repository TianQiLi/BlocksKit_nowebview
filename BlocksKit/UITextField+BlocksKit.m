//
//  UITextField+BlocksKit.m
//  BlocksKit
//

#import "UITextField+BlocksKit.h"
#import "A2DynamicDelegate.h"
#import "NSObject+A2BlockDelegate.h"

#pragma mark Delegate

@interface A2DynamicUITextFieldDelegate : A2DynamicDelegate

@end

@implementation A2DynamicUITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
	BOOL ret = YES;
	id realDelegate = self.realDelegate;
    if (realDelegate && [realDelegate respondsToSelector:@selector(textFieldShouldBeginEditing:)] && ![self isNeedIgnore:realDelegate])
		ret = [realDelegate textFieldShouldBeginEditing:textField];
	BOOL (^block)(UITextField *) = [self blockImplementationForMethod:_cmd];
	if (block)
		ret &= block(textField);
	return ret;
}
- (BOOL)isNeedIgnore:(id)realDelegate
{
    //否则会循环调用
    if (realDelegate && [realDelegate isKindOfClass:NSClassFromString(@"UIEditUserWordController")]) {
        return YES;
    }
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textFieldDidBeginEditing:)] && ![self isNeedIgnore:realDelegate])
		[realDelegate textFieldDidBeginEditing:textField];
	void (^block)(UITextField *) = [self blockImplementationForMethod:_cmd];
	if (block)
		block(textField);
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
	BOOL ret = YES;
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textFieldShouldEndEditing:)] && ![self isNeedIgnore:realDelegate])
		ret = [realDelegate textFieldShouldEndEditing:textField];
	BOOL (^block)(UITextField *) = [self blockImplementationForMethod:_cmd];
	if (block)
		ret &= block(textField);
	return ret;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textFieldDidEndEditing:)] && ![self isNeedIgnore:realDelegate])
		[realDelegate textFieldDidEndEditing:textField];
	void (^block)(UITextField *) = [self blockImplementationForMethod:_cmd];
	if (block)
		block(textField);
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	BOOL ret = YES;
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)] && ![self isNeedIgnore:realDelegate])
		ret = [realDelegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
	BOOL (^block)(UITextField *, NSRange, NSString *) = [self blockImplementationForMethod:_cmd];
	if (block)
		ret &= block(textField, range, string);
	return ret;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
	BOOL ret = YES;
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textFieldShouldClear:)] && ![self isNeedIgnore:realDelegate])
		ret = [realDelegate textFieldShouldClear:textField];
	BOOL (^block)(UITextField *) = [self blockImplementationForMethod:_cmd];
	if (block)
		ret &= block(textField);
	return ret;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	BOOL ret = YES;
	id realDelegate = self.realDelegate;
	if (realDelegate && [realDelegate respondsToSelector:@selector(textFieldShouldReturn:)] && ![self isNeedIgnore:realDelegate])
		ret = [realDelegate textFieldShouldReturn:textField];
	BOOL (^block)(UITextField *) = [self blockImplementationForMethod:_cmd];
	if (block)
		ret &= block(textField);
	return ret;
}

@end

#pragma mark - Category

@implementation UITextField (BlocksKit)

@dynamic bk_shouldBeginEditingBlock, bk_didBeginEditingBlock, bk_shouldEndEditingBlock, bk_didEndEditingBlock, bk_shouldChangeCharactersInRangeWithReplacementStringBlock, bk_shouldClearBlock, bk_shouldReturnBlock;

+ (void)load {
    [self bk_registerDynamicDelegate];
    [self bk_linkDelegateMethods: @{
        @"bk_shouldBeginEditingBlock": @"textFieldShouldBeginEditing:",
        @"bk_didBeginEditingBlock": @"textFieldDidBeginEditing:",
        @"bk_shouldEndEditingBlock": @"textFieldShouldEndEditing:",
        @"bk_didEndEditingBlock" : @"textFieldDidEndEditing:",
        @"bk_shouldChangeCharactersInRangeWithReplacementStringBlock" : @"textField:shouldChangeCharactersInRange:replacementString:",
        @"bk_shouldClearBlock" : @"textFieldShouldClear:",
        @"bk_shouldReturnBlock" : @"textFieldShouldReturn:",
    }];
}

@end

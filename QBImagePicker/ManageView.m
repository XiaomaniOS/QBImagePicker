//
//  ManageView.m
//  QBImagePicker
//
//  Created by Hackice on 2020/11/17.
//  Copyright © 2020 Katsuma Tanaka. All rights reserved.
//

#import "ManageView.h"

@interface ManageView ()

@property (nonatomic, strong) NSBundle *assetBundle;

@end

@implementation ManageView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeLabel];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initializeLabel];
    }
    return self;
}

- (void)initializeLabel {
    
    self.assetBundle = [NSBundle bundleForClass:[self class]];
    NSString *bundlePath = [self.assetBundle pathForResource:@"QBImagePicker" ofType:@"bundle"];
    if (bundlePath) {
        self.assetBundle = [NSBundle bundleWithPath:bundlePath];
    }
    
    self.label = [UILabel new];
    NSString *title = NSLocalizedStringFromTableInBundle(@"assets.header.tips", @"QBImagePicker", self.assetBundle, nil);
    self.label.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.label.textColor = [UIColor colorWithRed:144/255.0 green:144/255.0 blue:144/255.0 alpha:255/255.0];
    self.label.font = [UIFont systemFontOfSize:12];
    self.label.numberOfLines = 0;
    self.label.text = title;
    [self addSubview:self.label];
    
    self.button = [UIButton new];

    UIFont *font = [UIFont systemFontOfSize:12];
    [[self.button titleLabel] setFont: font];
    NSString *buttonTitle = NSLocalizedStringFromTableInBundle(@"assets.header.manage", @"QBImagePicker", self.assetBundle, nil);
    [self.button setTitle:buttonTitle forState: UIControlStateNormal];
    [self.button setContentEdgeInsets:UIEdgeInsetsMake(0, 16, 0, 16)];
    [self.button setTitleColor:[UIColor colorWithRed:1/255.0 green:122/255.0 blue:255/255.0 alpha:255/255.0] forState:UIControlStateNormal];
    
    [self addSubview:self.button];
    
    [self.button sizeToFit];
    self.button.frame = CGRectMake(self.bounds.size.width - self.button.bounds.size.width, 0, self.button.bounds.size.width, self.bounds.size.height);
    self.label.frame = CGRectMake(16, 0, self.bounds.size.width - self.button.bounds.size.width, self.bounds.size.height);
}

@end

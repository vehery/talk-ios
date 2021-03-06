//
//  SystemMessageTableViewCell.m
//  VideoCalls
//
//  Created by Ivan Sein on 07.08.18.
//  Copyright © 2018 struktur AG. All rights reserved.
//

#import "SystemMessageTableViewCell.h"

@implementation SystemMessageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        
        [self configureSubviews];
    }
    return self;
}

- (void)configureSubviews
{
    [self.contentView addSubview:self.dateLabel];
    [self.contentView addSubview:self.bodyTextView];
    
    NSDictionary *views = @{@"dateLabel": self.dateLabel,
                            @"bodyTextView": self.bodyTextView,
                            };
    
    NSDictionary *metrics = @{@"avatar": @50,
                              @"right": @10,
                              @"left": @5
                              };
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-avatar-[bodyTextView]-[dateLabel(40)]-right-|" options:0 metrics:metrics views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-left-[bodyTextView(>=0@999)]-left-|" options:0 metrics:metrics views:views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-left-[dateLabel(20)]-(>=0)-|" options:0 metrics:metrics views:views]];
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    CGFloat pointSize = [SystemMessageTableViewCell defaultFontSize];
    self.bodyTextView.font = [UIFont systemFontOfSize:pointSize];
    self.bodyTextView.text = @"";
    self.dateLabel.text = @"";
}

#pragma mark - Getters

- (MessageBodyTextView *)bodyTextView
{
    if (!_bodyTextView) {
        _bodyTextView = [MessageBodyTextView new];
        _bodyTextView.font = [UIFont systemFontOfSize:[SystemMessageTableViewCell defaultFontSize]];
    }
    return _bodyTextView;
}

- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [UILabel new];
        _dateLabel.textAlignment = NSTextAlignmentRight;
        _dateLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _dateLabel.backgroundColor = [UIColor clearColor];
        _dateLabel.userInteractionEnabled = NO;
        _dateLabel.numberOfLines = 1;
        _dateLabel.textColor = [UIColor lightGrayColor];
        _dateLabel.font = [UIFont systemFontOfSize:12.0];
    }
    return _dateLabel;
}

+ (CGFloat)defaultFontSize
{
    CGFloat pointSize = 16.0;
    
    //    NSString *contentSizeCategory = [[UIApplication sharedApplication] preferredContentSizeCategory];
    //    pointSize += SLKPointSizeDifferenceForCategory(contentSizeCategory);
    
    return pointSize;
}

@end

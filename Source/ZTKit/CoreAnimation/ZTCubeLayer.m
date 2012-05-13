//
//  ZTCubeLayer.m
//  ZTKit
//
//  Created by Zachry Thayer on 4/24/12.
//  Copyright (c) 2012 Zachry Thayer. All rights reserved.
//

#import "ZTCubeLayer.h"

#import "CALayer+Additions.h"

#import "../Categories/UIColor+ZTKit.h"
#import "../ZTHelpers.h"

@interface ZTCubeLayer ()

- (void)initialize;

- (BOOL)faceIsValidFace:(ZTCubeLayerFaces)face;
- (CGColorRef)shadeColor:(UIColor*)color forFace:(ZTCubeLayerFaces)face;
- (CATransform3D)transformForFace:(ZTCubeLayerFaces)face;

@end

@implementation ZTCubeLayer

ZTKCALayerInitialize
{
    for (int i = 0; i < ZTCubeFaceCount; i++)
    {
        CALayer *face = [[CALayer alloc] init];
        [self addSublayer:face];
    }
    
    CGFloat components[] = {0.3f, 0.3f, 0.5f, 1.f};
    self.backgroundColor = [[UIColor redColor] CGColor];//CGColorCreate(CGColorSpaceCreateDeviceRGB(), components);
    
}

#pragma mark Presentation

- (void)setContents:(id)contents
{
    [self recursiveContents:contents];
}

- (void)setBackgroundColor:(CGColorRef)backgroundColor
{
    NSInteger faceIndex = ZTCubeFront;
    for (CALayer* layer in self.sublayers)
    {
        layer.backgroundColor = [self shadeColor:[UIColor colorWithCGColor:backgroundColor] forFace:faceIndex];
        faceIndex ++;
    } 
}

#pragma mark - Layout

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    NSInteger faceIndex = ZTCubeFront;
    for (CALayer* face in self.sublayers)
    {
        face.transform = [self transformForFace:(ZTCubeLayerFaces)faceIndex];
        if (faceIndex < ZTCubeTop)
        {
            face.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        }
        else 
        {
            //face.anchorPointZ = frame.size.width;
            face.frame = CGRectMake(0, 0, frame.size.width, frame.size.width);
        }
        faceIndex ++;
    }
}

#pragma mark - Styling

- (void)setBorderColor:(CGColorRef)borderColor
{
    NSInteger faceIndex = ZTCubeFront;
    for (CALayer* layer in self.sublayers)
    {
        layer.borderColor = [self shadeColor:[UIColor colorWithCGColor:borderColor] forFace:faceIndex];
        faceIndex ++;
    } 
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    for (CALayer* layer in self.sublayers)
    {
        layer.borderWidth = borderWidth;
        [layer recursiveBorderWidth:borderWidth];
    } 
}

#pragma mark - Private Helpers

- (BOOL)faceIsValidFace:(ZTCubeLayerFaces)face
{
    return (face >= 0 && face < ZTCubeFaceCount);
}

- (CGColorRef)shadeColor:(UIColor*)color forFace:(ZTCubeLayerFaces)face
{
    switch (face) {
        case ZTCubeFront:
            return [[color colorByChangingBrighness:1.8f] CGColor];//[color CGColor];
            break;
            
        case ZTCubeRight:
            return [[color colorByChangingBrighness:1.1f] CGColor];
            break;
            
        case ZTCubeBack:
            return [[color colorByChangingBrighness:0.8f] CGColor];
            break;
            
        case ZTCubeLeft:
            return [[color colorByChangingBrighness:0.9f] CGColor];
            break;
            
        case ZTCubeTop:
            return [[color colorByChangingBrighness:1.2f] CGColor];
            break;
            
        case ZTCubeBottom:
            return [[color colorByChangingBrighness:0.7f] CGColor];
            break;
        default:
            break;
    }
    
    return [color CGColor];
}

- (CATransform3D)transformForFace:(ZTCubeLayerFaces)face
{
    if ([self faceIsValidFace:face])
    {
        CATransform3D theTransform = CATransform3DIdentity;

        switch (face) {
            case ZTCubeFront:
                theTransform = CATransform3DTranslate(theTransform, 0, 0, self.bounds.size.width*0.5);
                break;
                
            case ZTCubeRight:
                theTransform = CATransform3DRotate(theTransform, M_PI_2, 0, 1.f, 0);
                theTransform = CATransform3DTranslate(theTransform, 0, 0, self.bounds.size.width*0.5);
                break;
                
            case ZTCubeBack:
                theTransform = CATransform3DRotate(theTransform, M_PI, 1.f, 0, 0);
                theTransform = CATransform3DTranslate(theTransform, 0, 0, self.bounds.size.width*0.5);

                break;
                
            case ZTCubeLeft:
                theTransform = CATransform3DRotate(theTransform, M_PI_2 * 3, 0, 1.f, 0);
                theTransform = CATransform3DTranslate(theTransform, 0, 0, self.bounds.size.width*0.5);

                break;
                
            case ZTCubeTop:
                theTransform = CATransform3DRotate(theTransform, M_PI_2, 1.f, 0, 0);
                theTransform = CATransform3DTranslate(theTransform, 0, 0, self.bounds.size.width*0.5);

                break;
                
            case ZTCubeBottom:
                theTransform = CATransform3DRotate(theTransform, -M_PI_2, 1.f, 0, 0);
                theTransform = CATransform3DTranslate(theTransform, 0, 0, self.bounds.size.width*0.5);

                break;
            default:
                break;
        }
        
        return theTransform;
    }
    
    return CATransform3DIdentity;
}

- (CALayer*)layerForFace:(ZTCubeLayerFaces)face
{
    return [self.sublayers objectAtIndex:face];
}

@end

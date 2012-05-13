//
//  ZTCubeLayer.h
//  ZTKit
//
//  Created by Zachry Thayer on 4/24/12.
//  Copyright (c) 2012 Zachry Thayer. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef enum
{    
    ZTCubeFront,
    ZTCubeRight,
    ZTCubeBack,
    ZTCubeLeft,
    ZTCubeTop,
    ZTCubeBottom,
    ZTCubeFaceCount
}
ZTCubeLayerFaces;

@interface ZTCubeLayer : CATransformLayer

// Warning: do not call "removeFromSuperlayer" on returned layer.
- (CALayer*)layerForFace:(ZTCubeLayerFaces)face;

@end

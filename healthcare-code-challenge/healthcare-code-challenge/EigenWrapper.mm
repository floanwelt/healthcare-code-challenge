//
//  EigenWrapper.m
//  healthcare-code-challenge
//
//  Created by Florian Abel on 26.01.20.
//  Copyright © 2020 Florian Abel. All rights reserved.
//

#import "EigenWrapper.h"
#import "eigen_3.3.7/Eigen/Core"

@interface EigenWrapper ()

@end

@implementation EigenWrapper

+ (NSString *)eigenVersionString {
    return [NSString stringWithFormat:@"Eigen Version %d.%d.%d",     EIGEN_WORLD_VERSION, EIGEN_MAJOR_VERSION, EIGEN_MINOR_VERSION];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

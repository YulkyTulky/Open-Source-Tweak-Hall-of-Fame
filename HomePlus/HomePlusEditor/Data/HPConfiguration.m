//
// HPConfiguration.m
// HomePlus 
//
// This class should serve as a paste-in for NSUserDefaults
// Which is why some of these methods may seem completely unneeded. 
//
//
#include "HPConfiguration.h"
#include "HPUtility.h"


@implementation HPConfiguration

- (instancetype)init
{
    self = [super init];

    if (self) {
        self.values = [[NSMutableDictionary alloc] init];
    }

    return self;
}

- (instancetype)initWithConfigurationName:(NSString *)name
{
    self = [self init];
    
    if (![name containsString:@".plist"])
    {
        name = [NSString stringWithFormat:@"%@%@", name, @".plist"];
    }

    self.configurationName = name;
    BOOL _; 
    if (![[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"%@%@", @"/var/mobile/Documents/HomePlus/Loadouts/", name] isDirectory:&_])
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:@"/var/mobile/Documents/HomePlus/Loadouts/"
                          withIntermediateDirectories:YES
                                           attributes:nil
                                                error:nil];
        [self writeDefaults];
    }
    //self.values = [NSMutableDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"%@%@", @"/var/mobile/Documents/HomePlus/Loadouts/", name]];
    self.values = [[[NSDictionary alloc] initWithContentsOfFile:[NSString stringWithFormat:@"%@%@", @"/var/mobile/Documents/HomePlus/Loadouts/", name]] mutableCopy];
    self.readableName = [self.configurationName substringToIndex:(self.configurationName.length - 6)]; // Remove .plist
    return self;
}

- (void)writeDefaults
{
    NSString *location = @"Root";
    NSString *name = @"Default";
    NSString *prefix = [NSString stringWithFormat:@"%@%@", @"HPTheme", name];


    [self setInteger:0
                    forKey:@"HPTutorialGiven"];

    [self setBool:NO
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"IconLabels"]];
    [self setBool:NO
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"IconBadges"]];
    [self setBool:NO
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"IconLabelsF"]];
    [self setBool:NO
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"DockBG"]];
    [self setBool:NO
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"ModernDock"]];

    prefix = [NSString stringWithFormat:@"%@%@%@", @"HPTheme", name, location];
    [self setInteger:4
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"Columns"]];
    [self setInteger:[HPUtility defaultRows]
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"Rows"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"TopInset"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"LeftInset"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"SideInset"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"VerticalSpacing"]];
    [self setFloat:60.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"Scale"]];
    [self setFloat:100.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"IconAlpha"]];

    
    location = @"RootWithSidebar";
    prefix = [NSString stringWithFormat:@"%@%@%@", @"HPTheme", name, location];
    [self setInteger:4
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"Columns"]];
    [self setInteger:[HPUtility defaultRows]
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"Rows"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"TopInset"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"LeftInset"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"SideInset"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"VerticalSpacing"]];
    [self setFloat:60.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"Scale"]];
    [self setFloat:100.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"IconAlpha"]];
    

    location = @"RootLandscape";
    prefix = [NSString stringWithFormat:@"%@%@%@", @"HPTheme", name, location];
    [self setInteger:[HPUtility defaultRows]
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"Columns"]];
    [self setInteger:4
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"Rows"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"TopInset"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"LeftInset"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"SideInset"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"VerticalSpacing"]];
    [self setFloat:60.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"Scale"]];
    [self setFloat:100.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"IconAlpha"]];


    
    location = @"RootWithSidebarLandscape";
    prefix = [NSString stringWithFormat:@"%@%@%@", @"HPTheme", name, location];
    [self setInteger:[HPUtility defaultRows]
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"Columns"]];
    [self setInteger:4
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"Rows"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"TopInset"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"LeftInset"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"SideInset"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"VerticalSpacing"]];
    [self setFloat:60.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"Scale"]];
    [self setFloat:100.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"IconAlpha"]];

    location = @"Dock";
    prefix = [NSString stringWithFormat:@"%@%@%@", @"HPTheme", name, location];
    [self setInteger:4.0
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"Columns"]];
    [self setInteger:1.0
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"Rows"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"TopInset"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"LeftInset"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"SideInset"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"VerticalSpacing"]];
    [self setFloat:60.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"Scale"]];
    [self setFloat:100.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"IconAlpha"]];
    
    location = @"Folder";
    prefix = [NSString stringWithFormat:@"%@%@%@", @"HPTheme", name, location];
    [self setInteger:3 // THIS NEEDS TO BE SET BECAUSE FOLDERS ARE ACTUALLY MODIFIED BY THE TWEAK
                            // FOLDERS WILL CRASH SB IF MODIFIED TILL I ACTUALLY WRITE A PROPER IMPLEMENTATION
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"Columns"]];
    [self setInteger:3
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"Rows"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"TopInset"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"LeftInset"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"SideInset"]];
    [self setFloat:0.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"VerticalSpacing"]];
    [self setFloat:60.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"Scale"]];
    [self setFloat:100.0f
                    forKey:[NSString stringWithFormat:@"%@%@", prefix, @"IconAlpha"]];

    [self saveConfigurationToFile];
}

- (void)saveConfigurationToFile
{
    [self.values writeToFile:[NSString stringWithFormat:@"%@%@", @"/var/mobile/Documents/HomePlus/Loadouts/", self.configurationName] atomically: YES];
}

- (void)loadConfigurationFromFile
{
    self.values = [NSMutableDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"%@%@", @"/var/mobile/Documents/HomePlus/Loadouts/", self.configurationName]];
}

- (id)valueForKey:(NSString *)key
{
    return self.values[key];
}

- (id)objectForKey:(NSString *)key
{
    return self.values[key];
}

- (NSInteger)integerForKey:(NSString *)key
{
    return [self.values[key] integerValue];
}

- (BOOL)boolForKey:(NSString *)key
{
    if ([key isEqualToString:@"HPThemeDefaultForceRotation"])
        return NO;
    return [[self.values objectForKey:key] boolValue];
}

- (CGFloat)floatForKey:(NSString *)key
{
    return [[self.values objectForKey:key] floatValue];
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    [self.values setValue:value forKey:key];
}

- (void)setObject:(id)value forKey:(NSString *)key
{
    [self.values setValue:value forKey:key];
}

- (void)setInteger:(NSInteger)value forKey:(NSString *)key
{
    [self.values setValue:@(value) forKey:key];
}

- (void)setBool:(BOOL)value forKey:(NSString *)key
{
    [self.values setValue:@(value) forKey:key];
}

- (void)setFloat:(CGFloat)value forKey:(NSString *)key
{
    [self.values setValue:@(value) forKey:key];
}

@end
# Xcode UserData 

Install path: `.../Library/Developer/Xcode/UserData`

### Theme

• [Tomorrow Night](https://github.com/chriskempson/tomorrow-theme/tree/master/Xcode%204) with slight modifications.

###Code Snippets:

• mark

```objc
// Organize code in logical sections.
#pragma mark - <#section#>;
```


• strongself

```objc
// Declare strong reference to self.
typeof(self) __strong strongSelf = <#weakSelf#>;
```

• weakself

```objc
// Declare weak reference to self.
typeof(self) __weak weakSelf = self;
```

• documents
  
```objc
// Get URL to documents directory.
NSURL *documentsDirectoryURL = [NSURL fileURLWithPath:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]];
```

• library

```objc
// Get URL to library directory.
NSURL *libraryDirectoryURL = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
```

• extension

```objc
// Declare class extension.
@interface <#Class Name#> ()



@end
```

• lazy

```objc
// Declare getter with lazy instantiation.
- (<#Class#>)<#name#>
{
    if (_<#name#> == nil) {
        _<#name#> = <#Instantiate#>;
    }
    
    return _<#name#>;
}
```

• singleton

```objc
// Class method that returns singleton instance.
+ (instancetype)shared<#Name#>;
{
    static <#class#> *_shared<#Name#>;
    static dispatch_once_t onceToken;
    dispatch_once(&amp;onceToken, ^{
        _shared<#Name#> = <#initializer#>;
    });
    
    return _shared<#name#>;
}
```
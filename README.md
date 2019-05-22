# CustomKeyboardProject

A demo on how to create a custom input view that rests at the bottom of the view. 

## How to make:
1. Create the Custom input view
2. Override your view controller's `inputAccessoryView` with this input view
3. Create a protocol for your input view consisting of a `send()` method
4. Add this protocol to your view controller and set up the delegate `send()` method
5. Set the view controller as the input view's delegate.


## Preview clip:

![](https://github.com/wdesimini/CustomKeyboardProject/blob/master/CustomKeyboardProject/preview_clip.gif)

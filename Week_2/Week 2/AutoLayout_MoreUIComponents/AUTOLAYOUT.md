## Auto Layout Exercises

### Exercise 1 
* Add a `UIView` to `Main.storyboard`
* Change the `Background` color of the `UIView` to `green` and rename the `UIView` to __GreenView__
* For each example set below
    * Implement the outlined constraints 
    * Discuss their effect on the resulting interface layout

1. \
    `GreenView.height = 40.0`\
    `GreenView.width = 40.0`\
    `GreenView.centerY = superview.centerY`\
    `GreenView.centerX = superview.centerX`
2. \
    `GreenView.leading = superview.leading`\
    `GreenView.trailing = superview.trailing`\
    `GreenView.top = superview.top`\
    `GreenView.bottom = superview.bottom`
3. \
    `GreenView.leading = superview.leading`\
    `GreenView.trailing = superview.trailing`\
    `GreenView.top = superview.top`\
    `GreenView.bottom = 0.5 * superview.bottom`

### Exercise 2
* Add another `UIView` to `Main.storyboard`
* Change the `Background` color of the `UIView` to `blue` and rename the `UIView` to __BlueView__
* For each example set below
    * Implement the outlined constraints
    * Discuss what constraints are missing to draw __GreenView__ and __BlueView__ on the screen
    * Implement the remaining necessary constraints to see the views rendered on screen
    * Remember for every view we have to be able to calculate an origin point (x,y) and a size (width, height).

1. \
    `GreenView.leading = superview.leading`\
    `GreenView.top = superview.top`\
    `GreenView.height = 40.0`\
    `GreenView.width = 40.0`\
    ` `\
    `BlueView.leading = GreenView.trailing + 20`\
    `BlueView.height = GreenView.height`\
    `BlueView.width = GreenView.width`
2. \
    `GreenView.centerY = superview.centerY`\
    `GreenView.height = 40.0`\
    `GreenView.width = 0.10 * superview.width`\
    `BlueView.leading = GreenView.trailing + 20`\
    `BlueView.height = GreenView.height`\
    `BlueView.width = GreenView.width`
3. \
    `GreenView.top = superview.top`\
    `GreenView.leading = superview.leading`\
    `GreenView.trailing = superview.trailing`\
    `BlueView.bottom = superview.bottom`\
    `BlueView.leading = superview.leading`\
    `BlueView.trailing = superview.trailing`

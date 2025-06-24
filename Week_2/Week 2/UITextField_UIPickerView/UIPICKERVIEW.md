### In Main.storyboard
* Add a `UITextField` component
* Add a `UIImageView` component

### In ViewController.swift
1. Attach the properties listed above as `IBOutlets`
    * Name the `UITextField` `textfield`
    * Name the `UIImageView` `imageView`
2. Write a method that:
    * Takes an `AstrologicalSign` case as a paramter
    * Sets the `text` attribute of `textField` equal to the `AstrologicalSign`s `description` value
    * Sets the `image` attribute of `UIImageView` equal to the `AstrologicalSign`s `image` value
3. Conform `ViewController` to the `UIPickerViewDelegate` protocol
    * In `pickerView(_ pickerView:, didSelectRow row:, inComponent component:)`: Call the method from task __#2__, passing the argumet `AstrologicalSign.allCases[row]`
    * In `pickerView(_ pickerView:, titleForRow row:, forComponent component:)`: Return the `displayName` value of `AstrologicalSign.allCases[row]`
4. Conform `ViewController` to the `UIPickerViewDataSource` protocol
    * In `numberOfComponents(in pickerView: )`: Return `1`
    * In `pickerView(_ pickerView:, numberOfRowsInComponent component:)`: Return `AstrologicalSign.allCases.count`
5. In `viewDidLoad()`
    * Call the method implemented in task __#2__, passing `AstrologicalSign.allCases[0]` as an argument
    * Instantiate a `UIPickerView` object, name it `pickerView`
    * Set the `delegate` property of `pickerView` to `self`
    * Set the `dataSource` property of `pickerView` to `self`
    * Set the `inputView` property of `textfield` to `pickerView`



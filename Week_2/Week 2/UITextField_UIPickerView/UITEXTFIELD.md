
### In Main.storyboard
* Add a `UITextField` component

### In ViewController.swift
1. Attach the `UITextField` as an `IBOutlet`, name it `textfield`
2. Conform `ViewController` to the `UITextFieldDelegate` protocol
3. Add and explore each of the following function declarations\
`// return NO to disallow editing.`\
`func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool`\
` `\
`// became first responder`\
`func textFieldDidBeginEditing(_ textField: UITextField)`\
` `\
`// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end`\
`func textFieldShouldEndEditing(_ textField: UITextField) -> Bool`\
` `\
`// may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called`\
`func textFieldDidEndEditing(_ textField: UITextField)`\
` `\
`// if implemented, called in place of textFieldDidEndEditing:`\
`func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason)`\
` `\
`// return NO to not change text`\
`func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool`\
` `\
`@available(iOS 13.0, *)`\
`func textFieldDidChangeSelection(_ textField: UITextField) `\
` `\
`// called when clear button pressed. return NO to ignore (no notifications)`\
`func textFieldShouldClear(_ textField: UITextField) -> Bool`\
` `\
`// called when 'return' key pressed. return NO to ignore. `\
`func textFieldShouldReturn(_ textField: UITextField) -> Bool `
4. In `viewDidLoad()`: Set the `delegate` property of `textfield` to `self`
5. Discuss the purpose and use cases for each of the above-listed function of `UITextFieldDelegate`

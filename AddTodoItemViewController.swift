//
//  AddTodoItemViewController.swift
//  ToDoList
//
//  Created by romain on 10/05/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class AddTodoItemViewController: UIViewController {

    var toDoItem : TodoItem!
    var newView : UIView!
    var color : UIColor = UIColor.white
    var colorPicker : ColorPickerView!
    var isEdit : Bool = false
    var row : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPicker = ColorPickerView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        colorPicker.delegate = changeColor
        view.addSubview(colorPicker!)
        
        newView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.addSubview(newView)
        if toDoItem != nil {
            newView.backgroundColor = toDoItem.color
            color = toDoItem.color
            todoName.text = toDoItem.itemName
            DoneButton.isOn = toDoItem.completed
            isEdit = true
        } else {
            newView.backgroundColor = UIColor.white
            DoneButton.isHidden = true
            DoneButton.isOn = false;
            DoneLabel.isHidden = true
        }
        
        
        colorPicker.translatesAutoresizingMaskIntoConstraints = false
        var horizontalConstraint = colorPicker.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        var verticalConstraint = colorPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        var widthConstraint = colorPicker.widthAnchor.constraint(equalToConstant: 300)
        var heightConstraint = colorPicker.heightAnchor.constraint(equalToConstant: 300)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        horizontalConstraint = newView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        verticalConstraint = newView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        widthConstraint = newView.widthAnchor.constraint(equalToConstant: 100)
        heightConstraint = newView.heightAnchor.constraint(equalToConstant: 100)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (sender as? UIBarButtonItem) == Done{
            if let text = todoName.text, text.count > 0 {
                toDoItem = TodoItem(itemName: text, color: color)
                toDoItem.completed = DoneButton.isOn
            }
        }
    }
    
    func changeColor (_ color: UIColor) {
        self.color = color;
        newView.backgroundColor = color;
    }

    @IBOutlet weak var Done: UIBarButtonItem!
    
    @IBOutlet weak var DoneButton: UISwitch!
    @IBOutlet weak var DoneLabel: UILabel!
    
    @IBOutlet weak var todoName: UITextField!
}

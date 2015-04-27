//
//  ExampleViewController.swift
//  SwipeView Example
//
//  Created by Nick Lockwood on 03/04/2011.
//  Copyright 2011 Charcoal Design. All rights reserved.
//

class ExampleViewController: UIViewController,SwipeViewDataSource, SwipeViewDelegate {
    
    
    @IBOutlet weak var swipeView:SwipeView!
    var items = Array<Int>()
    override func awakeFromNib() {
        //set up data
        //your swipeView should always be driven by an array of
        //data of some kind - don't store data in your item views
        //or the recycling mechanism will destroy your data once
        //your item views move off-screen
        for var i:Int=0; i<100; i++
        {
            self.items.append(i)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //configure swipeView
        self.swipeView.pagingEnabled = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfItemsInSwipeView(swipeView: SwipeView!) -> Int {
        //return the total number of items in the carousel
        return self.items.count
    }
    func swipeView(swipeView: SwipeView!, viewForItemAtIndex index: Int, reusingView view: UIView!) -> UIView! {
        
        var label: UILabel! = nil
         //create new view if no view is available for recycling
        var newView = view
        
        if newView == nil
        {
            //don't do anything specific to the index within
            //this `if (view == nil) {...}` statement because the view will be		             //this `if (view == nil) {...}` statement because the view will be
            //recycled and used with other index values later		             //recycled and used with other index values later
            newView = UIView()
            newView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
            
            label = UILabel(frame: newView.bounds)
            label.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
            label.backgroundColor = UIColor.clearColor()
            label.textAlignment = NSTextAlignment.Center
            label.font = label.font.fontWithSize(50)
            label.tag = 1
            newView.addSubview(label)
        }
        else
        {
            //get a reference to the label in the recycled view
            label = newView.viewWithTag(1) as! UILabel!
        }
        var red:CGFloat = CGFloat(Float(arc4random()) / Float(INT_MAX))
        var green:CGFloat = CGFloat(Float(arc4random()) / Float(INT_MAX))
        var blue:CGFloat = CGFloat(Float(arc4random()) / Float(INT_MAX))
        newView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
        label.text = String(self.items[index])
        return newView
    }
    func swipeViewItemSize(swipeView: SwipeView!) -> CGSize {
        return self.swipeView.bounds.size
    }
}


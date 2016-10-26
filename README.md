## Synopsis

Code sample that demonstrates the ability to fill a partial ring with animation. This is an interesting project in that it entails being able to scale the ring along with different views. The ring view is set to 2/3 of the width of the screen, so it must scale and still animate. 

**Four** layers were used to accomplish this. A background ring (fillable view), a foreground ring (what it is being filled with), a mask ring (to mask the area that needs to be filled), and mask pie that adjusts to reveal only portions of the mask ring.

A minor MVVC pattern was used to separate model logic, view logic and views from having logic. 

## Original Request

-  The circular gauge should be 2/3 the width of the view and centered vertically
-  There should be at least 8 points between all elements on the interior of the layout
-  All border items should 16 points from the edge
-  The numbers displayed in the view are highly variable (that is, can become much larger)
-  Just provide layout for the white background area and its elements (no need to do the gray border)
-  Please write code to do the layout, you can use any layout API you wish (UIKit, Pure Layout, etc)
-  Extra credit for providing code to draw the circular gauge animated

## Motivation

I felt this was challenging to do this while working with autolayout, layers and iOS. Added the ability to reset and fill in new data. **IF YOU DO THIS**: Please note that the view sliding up behind the keyboard is not fully implemented. This will come later.

## Demo Project

RingGaugeDemo is also provided to demonstrate how the action works.

## Tests

Minor Unit Test coverage is provided to cover the models and their logic.

## License

Apache
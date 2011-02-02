Solution design
===============

Global Variables
================

	$X and $Y are the global variable defaults to 5,5
	when Area class is initialized they are set to PLATEAU AREA LIMITS
	
Four Classes
===========

	**Plateau**
		To initialize the plateau area say 5,5 (based on user input) => set to some global variables
		_properties_
			valid_position? => to check wheather a given position is valid or not?
	**Rover**
		rover's are the objects of this class
		_attributes_
			starting x, y, o attributes i.e. x and y co-ordinates and o orientation (E,W,N,S)
			SEQUENCE array => to store all the steps Rover will follow before actually moving and running into dangerous condition
		_properties_
			INITIALIZE the rover
			EXPLORE reads the instruction set and stores the positions as per each instruction set in SEQUENCE array
	**movement**
			called by rover
			_attributes_
				current x, y, head attributes of rover. x and y co-ordinates and rover head (E,W,N,S)
			_properties_
				ROTATE left or right only
				MOVE forward based on orientation (if next move is valid)
	**navigation**
			only class methods 
			HEAD hash to find Left/Right of current position
			_methods_
				rotate_left returns the HEAD position when rotates left from current orientation
				rotate_right returns the HEAD position when rotates right from current orientation
				next_position returns the next position based on current x, y co-ordinates
			
Code
====
	1. shall handle all the uppercase/lowercase instance and operate smoothly
	2. shall take care of input format else throw error
	3. retrieval of data shall be fast. As in case of rotation using HASH
	4. Errors must be stored in case of movement else exception must be thrown
	5. Assumes all the input as positive numbers (converts them)
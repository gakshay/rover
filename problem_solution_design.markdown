Solution design
===============

Rotation Constant
=================

	Rotation from a particular directions are stored in a hash for easy access and retrieval of next rotation direction
	`HEAD = {"N" => %w(W E),
	  "E" => %w(N S),
	  "W" => %w(S N),
	  "S" => %w(E W)
	}`
	So Left rotation form N is HEAD['N'][0] and right rotation from W is HEAD['W][1]
		
Global Variables
================

	$X and $Y are the global variable defaults to 5,5
	when Area class is initialized they are set to PLATEAU AREA LIMITS
	
Two Classes
===========

	**Area**
		To initialize the plateau area say 5,5 (based on user input) => set to some global variables
		_properties_
			valid_position? => to check wheather a given position is valid or not?
	**Rover**
		rover's are the objects of this class
		_attributes_
			current x, y, o attributes i.e. x and y co-ordinates and o orientation (E,W,N,S)
			SEQUENCE array => to store all the steps Rover will follow before actually moving and running into dangerous condition
		_properties_
			INITIALIZE the rover
			EXPLORE reads the instruction set and stores the positions as per each instruction set
			ROTATE left or right only
			MOVE based on orientation (if next move is valid)
			
Code
====
	1. shall handle all the uppercase/lowercase instance and operate smoothly
	2. shall take care of input format else throw error
	3. retrieval of data shall be fast. As in case of rotation using HASH
	4. Errors must be stored in case of movement else exception must be thrown
	5. Assumes all the input as positive numbers (converts them)
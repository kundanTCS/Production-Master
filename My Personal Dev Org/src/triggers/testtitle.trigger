trigger testtitle on Contact (before insert) 
{

  Trigger.new[0].title= '<javascript>Hello</javascript>Goodbye';
   // Trigger.new[0].title= 'COOOOOOOOOOOOOOOOOOO';

}
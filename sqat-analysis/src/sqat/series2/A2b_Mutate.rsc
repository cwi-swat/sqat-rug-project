module sqat::series2::A2b_Mutate

import lang::java::\syntax::Java15;
import ParseTree;
import util::FileSystem;

/*

Assignment: mutate (non-test) code to introduce test failure

- Write two transformations:
  1. condition flipping
  2. statement deletion

- Provide a log of the performed mutations (a rel[loc at, str from, str to])
  to quickly see what you've mutated.
 
Use coverage info from the previous assignment (either static or dynamic) 
to relevant methods to mutate.
 

Tips:
- create a shadow JPacman project (e.g. jpacman-mutated) to write out the transformed source files.
  Then run the tests there. You can update source locations l = |project://jpacman/....| to point to the 
  same location in a different project by updating its authority: l.authority = "jpacman-mutated"; 

- to remove statements in a list, you have to match an element in the list itself in its context, e.g. in visit:
     case (Block)`{<BlockStm* stms> <Stm}` => (Block)`{<BlockStm insertedStm> <BlockStm* stms>}` 
  
- or (easier) use the helper function provide below to insert stuff after every
  statement in a statement list.

- to parse ordinary values (int/str etc.) into Java15 syntax trees, use the notation
   [NT]"...", where NT represents the desired non-terminal (e.g. Expr, IntLiteral etc.).  

*/

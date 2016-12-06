module Java17ish

extend lang::java::\syntax::Java15;
import util::FileSystem;
import ParseTree;
import IO;

syntax TypeParams 
  = inferredTypeParams: "\<" "\>" 
  ;

syntax TypeArgs =
   inferredTypeArgs: "\<" "\>" 
  ;
  
syntax Stm 
  =  \try: "try" "(" Type VarDec ")" Block CatchClause* "finally"  Block
  |  \try: "try" "(" Type VarDec ")" Block CatchClause+ 
  |  \try: "try" "(" Type VarDec ")" Block  
  ; 

start[CompilationUnit] parseJava(loc l) {
  return parse(#start[CompilationUnit], l, allowAmbiguity=true);
}

void testOnJPacman() {
  for (f <- files(|project://jpacman-framework/src|), f.extension == "java") {
    try {
      println("Parsing: <f>");
      parseJava(f);
    }
    catch ParseError(loc l): {
      println("Parse error: <l>");
    }
  }  
}  

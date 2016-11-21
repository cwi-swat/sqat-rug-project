module sqat::series2::Dicto

extend lang::std::Layout;

start syntax Dicto
  = Rule*
  ;

syntax Rule
  = Entity Modality Relation Entity
  ;
  
syntax Modality
  = must: "must"
  | may: "may"
  | cannot: "cannot"
  | canOnly: "can" "only"
  ;

syntax Relation
  = "import" // pkg
  | "depend" // class/pkg
  | "invoke" // method
  | "instantiate" // class
  | "inherit" //class 
  ;

syntax Entity
  = class: {Id "."}+
  | method: {Id "."}+ "::" Id
  ;

syntax Id =
   id: [$ A-Z _ a-z] !<< ID !>> [$ 0-9 A-Z _ a-z] 
  ;

lexical ID =
  [$ A-Z _ a-z] [$ 0-9 A-Z _ a-z]* 
  ;
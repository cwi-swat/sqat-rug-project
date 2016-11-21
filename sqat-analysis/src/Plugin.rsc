module Plugin

import sqat::series2::Dicto;
import sqat::series2::A3_Architecture;
import util::IDE;
import ParseTree;
import util::ResourceMarkers;
import lang::java::jdt::m3::Core;
import IO;

void main() {
  registerLanguage("Dicto", "dicto", start[Dicto](str src, loc org) {
    return parse(#start[Dicto], src, org);
  });
  
  registerContributions("Dicto", {
    builder(set[Message] (start[Dicto] pt) {
      println("Building...");
      return eval(pt, createM3FromEclipseProject(|project://jpacman|));
    })
  });
}
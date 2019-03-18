#include "url/url_canon.h"
#include "url/url_canon_stdstring.h"

#include <iostream>
#include <string>

int main(int argc, char*argv[]) {
  if (argc < 2) return -1;
  auto len = strlen(argv[1]);
  std::string canonical_path;
  url::Component in_component(0, len);
  url::Component out_component;
  url::StdStringCanonOutput output(&canonical_path);
  if (!url::CanonicalizePath(argv[1], in_component, &output, &out_component)) {
    std::cerr << "CanonicalizePath failed";
    return 1;
  }
  output.Complete();
  std::cerr << "'" << canonical_path << "'";
  return 0;
}

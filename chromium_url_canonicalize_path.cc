#include "url/url_canon.h"
#include "url/url_canon_stdstring.h"

#include <unistd.h>
#include <iostream>
#include <string>

bool CanonicalizeOnePath(std::string path, std::string* canonical_path_ptr) {
  std::string canonical_path;
  url::Component in_component(0, path.size());
  url::Component out_component;
  url::StdStringCanonOutput output(&canonical_path);
  if (!url::CanonicalizePath(path.c_str(), in_component, &output, &out_component)) {
    return 0;
  }
  output.Complete();
  *canonical_path_ptr = std::move(canonical_path);
  return 1;
}

void CheckPath(std::string path, std::string expected_path) {
  std::string canonical_path;
  if (!CanonicalizeOnePath(path, &canonical_path)) {
    std::cerr << "url::CanonicalizePath failed for '" << path << "'";
    exit(1);
  }
  if (canonical_path != expected_path) {
    std::cerr << "url::CanonicalizePath mismatch for '" << path << "' -> '"
      << canonical_path << "' expected '" << expected_path << "'\n";
    exit(1);
  }
}

int tests() {
  CheckPath("/a/b/../c", "/a/c");
  CheckPath("a/b/../c", "/a/c");
  CheckPath("/a/b/../c\n", "/a/c%0A");
  CheckPath("/a/b/\0c", "/a/b/");
  return 0;
}

int main(int argc, char*argv[]) {
  if (argc < 2) {
    return tests();
  }
  std::string canonical_path;
  if (!CanonicalizeOnePath(argv[1], &canonical_path)) {
    std::cerr << "CanonicalizePath failed";
    return 1;
  }
  std::cerr << "'" << canonical_path << "'";
  return 0;
}

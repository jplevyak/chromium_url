all:
	bazel build --cxxopt=-std=c++14 :chromium_url_canonicalize_path
	bazel-bin/chromium_url_canonicalize_path

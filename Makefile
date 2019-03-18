all:
	bazel build --cxxopt=-std=c++14 :chromium_canonicalize_url

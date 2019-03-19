all:
	bazel build --cxxopt=-std=c++14 :chromium_url_canonicalize_path

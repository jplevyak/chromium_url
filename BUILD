# Description:
#   chromium_url, a copy of Chromiums's url library
licenses(["reciprocal"])  # BSD and MPL, MPL is more restrictive

exports_files([
    "LICENSE",
])

cc_library(
    name = "build_config",
    hdrs = ["src/build/build_config.h"],
    includes = ["src"],
)

cc_library(
    name = "base",
    srcs = [
        "src/base/strings/string_piece.cc",
        "src/base/strings/string_util.cc",
        "src/base/strings/utf_string_conversion_utils.cc",
        "src/base/strings/utf_string_conversions.cc",
        "src/base/strings/string_util_constants.cc",
        "src/base/third_party/icu/icu_utf.cc",
        "src/base/strings/string16.cc",
    ],
    hdrs = [
        "src/base/atomicops.h",
        "src/base/token.h",
        "src/base/hash.h",
        "src/base/unguessable_token.h",
        "src/base/no_destructor.h",
        "src/base/atomicops_internals_portable.h",
        "src/base/thread_annotations.h",
        "src/base/bit_cast.h",
        "src/base/template_util.h",
        "src/base/macros.h",
        "src/base/compiler_specific.h",
        "src/base/base_export.h",
        "src/base/export_template.h",
        "src/base/logging.h",
        "src/base/lazy_instance.h",
        "src/base/lazy_instance_helpers.h",
        "src/base/debug/alias.h",
        "src/base/gtest_prod_util.h",
        "src/base/debug/leak_annotations.h",
        "src/base/component_export.h",
        "src/base/containers/span.h",
        "src/base/containers/checked_iterators.h",
        "src/base/containers/util.h",
        "src/base/optional.h",
        "src/base/stl_util.h",
        "src/base/numerics/safe_conversions.h",
        "src/base/numerics/safe_conversions_impl.h",
        "src/base/strings/string16.h",
        "src/base/strings/strcat.h",
        "src/base/strings/char_traits.h",
        "src/base/strings/string_piece.h",
        "src/base/strings/string_piece_forward.h",
        "src/base/strings/string_number_conversions.h",
        "src/base/strings/string_util.h",
        "src/base/strings/utf_string_conversion_utils.h",
        "src/base/strings/utf_string_conversions.h",
        "src/base/strings/string_util_posix.h",
        "src/base/third_party/icu/icu_utf.h",
    ],
    includes = ["src"],
    deps = [
        ":build_config",
    ],
)

filegroup(
    name = "src_url_impls",
    srcs = glob(
        include = [
            "src/url/**/*.h",
            "src/url/url_canon.cc",
            "src/url/url_canon_internal.cc",
            "src/url/url_canon_path.cc",
            "src/url/url_canon_stdstring.cc",
        ],
    ),
)

cc_library(
    name = "canonicalize_path_lib",
    srcs = [":src_url_impls"],
    hdrs = [
        "src/url/gurl.h",
        "src/url/origin.h",
        "src/url/scheme_host_port.h",
        "src/url/third_party/mozilla/url_parse.h",
        "src/url/url_canon.h",
        "src/url/url_canon_stdstring.h",
        "src/url/url_constants.h",
        "src/url/url_util.h",
    ],
    includes = ["src"],
    visibility = ["//visibility:public"],
    deps = [
        ":base",
    ],
)

cc_binary(
    name = "chromium_url_canonicalize_path",
    srcs = ["chromium_url_canonicalize_path.cc"],
    deps = [":canonicalize_path_lib"],
)


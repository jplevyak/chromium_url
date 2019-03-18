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
            "src/url/**/*.cc",
            "src/url/**/*.h",
        ],
        exclude = [
            "src/url/gurl_fuzzer.cc",
            "src/url/*_perftest.cc",
            "src/url/*_perftests.cc",
            "src/url/*android*.cc",
            "src/url/ipc/*",
            "src/url/**/*unittest.cc",
            "src/url/*unittest.cc",
            "src/url/origin_unittest.cc",
            "src/url/gurl_unittest.cc",
            "src/url/scheme_host_port_unittest.cc",
            "src/url/*unittests.cc",
            "src/url/url_canon_internal_file.h",
            "src/url/url_test_utils.h",
        ],
    ),
)

filegroup(
    name = "icu_impls",
    srcs = glob(
        include = [
            "src/third_party/icu/source/common/unicode/*.cc",
            "src/third_party/icu/source/common/unicode/*.h",
        ],
        exclude = [
        ],
    ),
)

cc_library(
    name = "icu",
    srcs = [":icu_impls"],
    includes = ["src/third_party/icu/source/common"],
    visibility = ["//visibility:public"],
    linkstatic=1,
)

#cc_library(
#    name = "internal_headers",
#    hdrs = ["src/url/url_export.h"],
#    textual_hdrs = [
#        "src/url/url_canon_internal.h",
#        "src/url/url_canon_internal_file.h",
#    ],
#deps = ["//base"],
#)

cc_library(
    name = "chromium_url",
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
    copts = ["-UDISABLE_GOOGLE_GLOBAL_USING_DECLARATIONS"],
    includes = ["src"],
    visibility = ["//visibility:public"],
    deps = [
        ":base",
        ":icu",
#":internal_headers",
    ],
)

cc_library(
    name = "canon_icu",
    srcs = ["src/url/url_canon_icu.cc"],
    hdrs = ["src/url/url_canon_icu.h"],
    includes = ["src"],
    visibility = ["//visibility:public"],
    deps = [
        ":chromium_url",
#":internal_headers",
#"//third_party/icu:conversion",
    ],
)

cc_library(
    name = "test_utils",
    testonly = 1,
    hdrs = ["src/url/url_test_utils.h"],
    deps = [
        ":base",
        ":chromium_url",
#":internal_headers",
#"//testing/base/public:gunit_for_library",
    ],
)

cc_test(
    name = "gurl_unittest",
    size = "small",
    srcs = ["src/url/gurl_unittest.cc"],
    copts = ["-UDISABLE_GOOGLE_GLOBAL_USING_DECLARATIONS"],
    deps = [
        ":base",
        ":chromium_url",
        ":test_utils",
#"//testing/base/public:gunit_main",
    ],
)

cc_test(
    name = "origin_unittest",
    size = "small",
    srcs = ["src/url/origin_unittest.cc"],
    copts = ["-UDISABLE_GOOGLE_GLOBAL_USING_DECLARATIONS"],
    deps = [
        ":chromium_url",
#"//testing/base/public:gunit_main",
    ],
)

cc_test(
    name = "scheme_host_port_unittest",
    size = "small",
    srcs = ["src/url/scheme_host_port_unittest.cc"],
    copts = ["-UDISABLE_GOOGLE_GLOBAL_USING_DECLARATIONS"],
    deps = [
        ":chromium_url",
#"//testing/base/public:gunit_main",
    ],
)

cc_test(
    name = "url_canon_icu_unittest",
    size = "small",
    srcs = ["src/url/url_canon_icu_unittest.cc"],
    copts = ["-UDISABLE_GOOGLE_GLOBAL_USING_DECLARATIONS"],
    deps = [
        ":canon_icu",
        ":chromium_url",
        ":test_utils",
#"//testing/base/public:gunit_main",
#"//third_party/icu:headers",
    ],
)

cc_test(
    name = "url_canon_unittest",
    size = "small",
    srcs = ["src/url/url_canon_unittest.cc"],
    copts = ["-UDISABLE_GOOGLE_GLOBAL_USING_DECLARATIONS"],
    deps = [
        ":base",
        ":chromium_url",
#":internal_headers",
        ":test_utils",
#"//testing/base/public:gunit_main",
    ],
)

cc_test(
    name = "url_parse_unittest",
    size = "small",
    srcs = ["src/url/url_parse_unittest.cc"],
    copts = ["-UDISABLE_GOOGLE_GLOBAL_USING_DECLARATIONS"],
    deps = [
        ":chromium_url",
#"//testing/base/public:gunit_main",
    ],
)

cc_test(
    name = "url_util_unittest",
    size = "small",
    srcs = ["src/url/url_util_unittest.cc"],
    copts = ["-UDISABLE_GOOGLE_GLOBAL_USING_DECLARATIONS"],
    deps = [
        ":chromium_url",
        ":test_utils",
#"//testing/base/public:gunit_main",
    ],
)

filegroup(
    name = "srcs",
    srcs = glob([
        "src/url/**/*",
        "src/base/**/*",
        "src/build/**/*",
    ]),
    visibility = ["//visibility:public"],
)

cc_binary(
    name = "chromium_canonicalize_url",
    srcs = ["chromium_canonicalize_url.cc"],
    includes = ["src"],
    deps = [":chromium_url"],
)


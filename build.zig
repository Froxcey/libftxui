const std = @import("std");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const libftxuiScreen = b.addStaticLibrary(.{
        .name = "ftxui-screen",
        .target = target,
        .optimize = optimize,
    });
    addIncludePath(libftxuiScreen);
    libftxuiScreen.addCSourceFiles(.{ .files = &.{ "src/ftxui/screen/box.cpp", "src/ftxui/screen/color.cpp", "src/ftxui/screen/color_info.cpp", "src/ftxui/screen/screen.cpp", "src/ftxui/screen/string.cpp", "src/ftxui/screen/terminal.cpp" } });
    b.installArtifact(libftxuiScreen);

    const libftxuiDom = b.addStaticLibrary(.{
        .name = "ftxui-dom",
        .target = target,
        .optimize = optimize,
    });
    addIncludePath(libftxuiDom);
    libftxuiScreen.addCSourceFiles(.{ .files = &.{ "src/ftxui/dom/automerge.cpp", "src/ftxui/dom/blink.cpp", "src/ftxui/dom/bold.cpp", "src/ftxui/dom/hyperlink.cpp", "src/ftxui/dom/border.cpp", "src/ftxui/dom/box_helper.cpp", "src/ftxui/dom/canvas.cpp", "src/ftxui/dom/clear_under.cpp", "src/ftxui/dom/color.cpp", "src/ftxui/dom/composite_decorator.cpp", "src/ftxui/dom/dbox.cpp", "src/ftxui/dom/dim.cpp", "src/ftxui/dom/flex.cpp", "src/ftxui/dom/flexbox.cpp", "src/ftxui/dom/flexbox_config.cpp", "src/ftxui/dom/flexbox_helper.cpp", "src/ftxui/dom/focus.cpp", "src/ftxui/dom/frame.cpp", "src/ftxui/dom/gauge.cpp", "src/ftxui/dom/graph.cpp", "src/ftxui/dom/gridbox.cpp", "src/ftxui/dom/hbox.cpp", "src/ftxui/dom/inverted.cpp", "src/ftxui/dom/linear_gradient.cpp", "src/ftxui/dom/node.cpp", "src/ftxui/dom/node_decorator.cpp", "src/ftxui/dom/paragraph.cpp", "src/ftxui/dom/reflect.cpp", "src/ftxui/dom/scroll_indicator.cpp", "src/ftxui/dom/separator.cpp", "src/ftxui/dom/size.cpp", "src/ftxui/dom/spinner.cpp", "src/ftxui/dom/strikethrough.cpp", "src/ftxui/dom/table.cpp", "src/ftxui/dom/text.cpp", "src/ftxui/dom/underlined.cpp", "src/ftxui/dom/underlined_double.cpp", "src/ftxui/dom/util.cpp", "src/ftxui/dom/vbox.cpp" } });

    libftxuiDom.linkLibrary(libftxuiScreen);
    b.installArtifact(libftxuiDom);

    const libftxuiComponent = b.addStaticLibrary(.{
        .name = "ftxui-component",
        .target = target,
        .optimize = optimize,
    });
    addIncludePath(libftxuiComponent);
    libftxuiScreen.addCSourceFiles(.{ .files = &.{
        "src/ftxui/component/animation.cpp",
        "src/ftxui/component/button.cpp",
        "src/ftxui/component/catch_event.cpp",
        "src/ftxui/component/checkbox.cpp",
        "src/ftxui/component/collapsible.cpp",
        "src/ftxui/component/component.cpp",
        "src/ftxui/component/component_options.cpp",
        "src/ftxui/component/container.cpp",
        "src/ftxui/component/dropdown.cpp",
        "src/ftxui/component/event.cpp",
        "src/ftxui/component/hoverable.cpp",
        "src/ftxui/component/input.cpp",
        "src/ftxui/component/loop.cpp",
        "src/ftxui/component/maybe.cpp",
        "src/ftxui/component/menu.cpp",
        "src/ftxui/component/modal.cpp",
        "src/ftxui/component/radiobox.cpp",
        "src/ftxui/component/renderer.cpp",
        "src/ftxui/component/resizable_split.cpp",
        "src/ftxui/component/screen_interactive.cpp",
        "src/ftxui/component/slider.cpp",
        "src/ftxui/component/terminal_input_parser.cpp",
        "src/ftxui/component/util.cpp",
        "src/ftxui/component/window.cpp",
    } });
    libftxuiComponent.linkLibrary(libftxuiDom);
    b.installArtifact(libftxuiComponent);
}

fn addIncludePath(compile: *std.Build.Step.Compile) void {
    compile.addIncludePath(.{ .path = "include/" });
    compile.addIncludePath(.{ .path = "src/" });
    compile.linkLibCpp();
}

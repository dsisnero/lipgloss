# Lipgloss Issue #1: API surface parity for list support

## Status

Resolved.

## Validation

The previously reported missing APIs are present in the Crystal port:

* `Lipgloss.light_dark`
* `Lipgloss::Color`
* `Lipgloss.new_style`
* `Lipgloss.normal_border`
* `Lipgloss.height`
* `Lipgloss.join_vertical`
* `Lipgloss.style_runes`
* `Style#padding`, `Style#padding_left`
* `Style#margin`, `Style#margin_top`
* `Style#get_padding_left`, `Style#get_padding_right`, `Style#get_margin_top`
* `Style#foreground`, `Style#background`
* `Style#border`, `Style#border_foreground`
* `Style#underline`, `Style#inherit`
* `Style#set_string`, `Style#string`
* `Style#height`

## Notes

This document is kept as historical context and verification of parity coverage.

## References

* `vendor/bubbles/list/list.go`
* `vendor/bubbles/list/style.go`
* `vendor/bubbles/list/defaultitem.go`
* `src/lipgloss.cr`

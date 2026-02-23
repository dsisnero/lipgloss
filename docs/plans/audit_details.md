# Lipgloss Port Audit

Generated 2026-02-22 19:06:26 -07:00

## File-by-File Audit

### `query.go`

- [ ] `BackgroundColor`
- [ ] `HasDarkBackground`

### `tree/children.go`

- [x] `Append`
- [x] `Remove`
- [x] `Length`
- [x] `At`
- [ ] `NewStringData`
- [ ] `NewFilter`
- [x] `At`
- [x] `Filter`
- [x] `Length`

### `tree/tree.go`

- [ ] `NewLeaf`
- [x] `Children`
- [x] `Value`
- [ ] `SetValue`
- [x] `Hidden`
- [ ] `SetHidden`
- [x] `String`
- [x] `Hidden`
- [x] `Hide`
- [ ] `SetHidden`
- [x] `Offset`
- [x] `Value`
- [ ] `SetValue`
- [x] `String`
- [x] `Child`
- [ ] `EnumeratorStyle`
- [ ] `EnumeratorStyleFunc`
- [ ] `IndenterStyle`
- [ ] `IndenterStyleFunc`
- [ ] `RootStyle`
- [ ] `ItemStyle`
- [ ] `ItemStyleFunc`
- [x] `Enumerator`
- [x] `Indenter`
- [x] `Width`
- [x] `Children`
- [x] `Root`
- [x] `Root`
- [x] `New`

### `tree/enumerator.go`

- [ ] `DefaultEnumerator`
- [ ] `RoundedEnumerator`
- [ ] `DefaultIndenter`

### `style.go`

- [ ] `NewStyle`
- [x] `SetString`
- [x] `Value`
- [x] `String`
- [x] `Copy`
- [x] `Inherit`
- [x] `Render`

### `color.go`

- [x] `RGBA`
- [x] `Color`
- [x] `RGBA`
- [ ] `LightDark`
- [x] `Complete`
- [x] `Alpha`
- [x] `Complementary`
- [x] `Darken`
- [x] `Lighten`

### `compat/color.go`

- [x] `RGBA`
- [x] `RGBA`
- [x] `RGBA`

### `unset.go`

- [ ] `UnsetBold`
- [ ] `UnsetItalic`
- [ ] `UnsetUnderline`
- [ ] `UnsetStrikethrough`
- [ ] `UnsetReverse`
- [ ] `UnsetBlink`
- [ ] `UnsetFaint`
- [ ] `UnsetForeground`
- [ ] `UnsetBackground`
- [ ] `UnsetWidth`
- [ ] `UnsetHeight`
- [ ] `UnsetAlign`
- [ ] `UnsetAlignHorizontal`
- [ ] `UnsetAlignVertical`
- [ ] `UnsetPadding`
- [ ] `UnsetPaddingChar`
- [ ] `UnsetPaddingLeft`
- [ ] `UnsetPaddingRight`
- [ ] `UnsetPaddingTop`
- [ ] `UnsetPaddingBottom`
- [ ] `UnsetColorWhitespace`
- [ ] `UnsetMargins`
- [ ] `UnsetMarginLeft`
- [ ] `UnsetMarginRight`
- [ ] `UnsetMarginTop`
- [ ] `UnsetMarginBottom`
- [ ] `UnsetMarginBackground`
- [ ] `UnsetBorderStyle`
- [ ] `UnsetBorderTop`
- [ ] `UnsetBorderRight`
- [ ] `UnsetBorderBottom`
- [ ] `UnsetBorderLeft`
- [ ] `UnsetBorderForeground`
- [ ] `UnsetBorderTopForeground`
- [ ] `UnsetBorderRightForeground`
- [ ] `UnsetBorderBottomForeground`
- [ ] `UnsetBorderLeftForeground`
- [ ] `UnsetBorderForegroundBlend`
- [ ] `UnsetBorderForegroundBlendOffset`
- [ ] `UnsetBorderBackground`
- [ ] `UnsetBorderTopBackgroundColor`
- [ ] `UnsetBorderTopBackground`
- [ ] `UnsetBorderRightBackground`
- [ ] `UnsetBorderBottomBackground`
- [ ] `UnsetBorderLeftBackground`
- [ ] `UnsetInline`
- [ ] `UnsetMaxWidth`
- [ ] `UnsetMaxHeight`
- [ ] `UnsetTabWidth`
- [ ] `UnsetUnderlineSpaces`
- [ ] `UnsetStrikethroughSpaces`
- [ ] `UnsetTransform`
- [ ] `UnsetHyperlink`
- [ ] `UnsetString`

### `join.go`

- [x] `JoinHorizontal`
- [x] `JoinVertical`

### `size.go`

- [x] `Width`
- [x] `Height`
- [x] `Size`

### `borders.go`

- [ ] `GetTopSize`
- [ ] `GetRightSize`
- [ ] `GetBottomSize`
- [ ] `GetLeftSize`
- [ ] `NormalBorder`
- [ ] `RoundedBorder`
- [ ] `BlockBorder`
- [ ] `OuterHalfBlockBorder`
- [ ] `InnerHalfBlockBorder`
- [ ] `ThickBorder`
- [ ] `DoubleBorder`
- [ ] `HiddenBorder`
- [ ] `MarkdownBorder`
- [ ] `ASCIIBorder`

### `ansi_windows.go`

- [ ] `EnableLegacyWindowsANSI`

### `writer.go`

- [x] `Println`
- [x] `Printf`
- [x] `Print`
- [x] `Fprint`
- [x] `Fprintln`
- [x] `Fprintf`
- [x] `Sprint`
- [x] `Sprintln`
- [x] `Sprintf`

### `layer.go`

- [ ] `NewLayer`
- [ ] `GetContent`
- [x] `Width`
- [x] `Height`
- [ ] `GetID`
- [x] `ID`
- [x] `X`
- [x] `Y`
- [x] `Z`
- [ ] `GetX`
- [ ] `GetY`
- [ ] `GetZ`
- [ ] `AddLayers`
- [ ] `GetLayer`
- [ ] `MaxZ`
- [x] `Draw`
- [x] `Empty`
- [x] `ID`
- [x] `Layer`
- [x] `Bounds`
- [ ] `NewCompositor`
- [ ] `AddLayers`
- [x] `Bounds`
- [x] `Draw`
- [x] `Hit`
- [ ] `GetLayer`
- [x] `Refresh`
- [x] `Render`

### `position.go`

- [x] `Place`
- [ ] `PlaceHorizontal`
- [ ] `PlaceVertical`

### `runes.go`

- [ ] `StyleRunes`

### `table/rows.go`

- [ ] `NewStringData`
- [x] `Append`
- [x] `At`
- [x] `Columns`
- [x] `Item`
- [x] `Rows`
- [ ] `NewFilter`
- [x] `Filter`
- [x] `At`
- [x] `Columns`
- [x] `Rows`
- [ ] `DataToMatrix`

### `table/table.go`

- [ ] `DefaultStyles`
- [x] `New`
- [ ] `ClearRows`
- [ ] `BaseStyle`
- [x] `StyleFunc`
- [x] `Data`
- [ ] `GetData`
- [x] `Rows`
- [x] `Row`
- [x] `Headers`
- [ ] `GetHeaders`
- [x] `Border`
- [x] `BorderTop`
- [x] `BorderBottom`
- [x] `BorderLeft`
- [x] `BorderRight`
- [ ] `BorderHeader`
- [ ] `BorderColumn`
- [ ] `BorderRow`
- [x] `BorderStyle`
- [ ] `GetBorderTop`
- [ ] `GetBorderBottom`
- [ ] `GetBorderLeft`
- [ ] `GetBorderRight`
- [ ] `GetBorderHeader`
- [ ] `GetBorderColumn`
- [ ] `GetBorderRow`
- [x] `Width`
- [x] `Height`
- [ ] `GetHeight`
- [ ] `YOffset`
- [ ] `GetYOffset`
- [ ] `FirstVisibleRowIndex`
- [ ] `LastVisibleRowIndex`
- [ ] `VisibleRows`
- [x] `Wrap`
- [x] `String`
- [x] `Render`

### `examples/tree/toggle/main.go`

- [x] `String`
- [x] `String`

### `examples/tree/selection/main.go`

- [x] `String`
- [x] `String`
- [x] `Hidden`
- [x] `Children`
- [x] `Value`
- [ ] `SetValue`
- [ ] `SetHidden`
- [x] `Enumerator`
- [x] `Indenter`

### `examples/compat/bubbletea/main.go`

- [x] `Init`
- [ ] `Update`
- [x] `View`

### `examples/color/bubbletea/main.go`

- [x] `Init`
- [ ] `Update`
- [x] `View`

### `examples/list/glow/main.go`

- [x] `String`

### `examples/blending/border-blend-rotation/bubbletea/main.go`

- [x] `Init`
- [ ] `Update`
- [x] `View`

### `examples/blending/linear-1d/bubbletea/main.go`

- [x] `Init`
- [ ] `Update`
- [x] `View`

### `examples/blending/linear-2d/bubbletea/main.go`

- [x] `Init`
- [ ] `Update`
- [x] `View`

### `list/list.go`

- [x] `New`
- [x] `Hidden`
- [x] `Hide`
- [x] `Offset`
- [x] `Value`
- [x] `String`
- [ ] `EnumeratorStyle`
- [ ] `EnumeratorStyleFunc`
- [ ] `IndenterStyle`
- [ ] `IndenterStyleFunc`
- [x] `Indenter`
- [ ] `ItemStyle`
- [ ] `ItemStyleFunc`
- [x] `Item`
- [x] `Items`
- [x] `Enumerator`

### `list/enumerator.go`

- [x] `Alphabet`
- [x] `Arabic`
- [x] `Roman`
- [x] `Bullet`
- [x] `Asterisk`
- [x] `Dash`

### `ranges.go`

- [ ] `StyleRanges`
- [ ] `NewRange`

### `whitespace.go`

- [ ] `WithWhitespaceStyle`
- [ ] `WithWhitespaceChars`

### `canvas.go`

- [ ] `NewCanvas`
- [x] `Resize`
- [x] `Clear`
- [x] `Bounds`
- [x] `Width`
- [x] `Height`
- [ ] `CellAt`
- [ ] `SetCell`
- [ ] `WidthMethod`
- [x] `Compose`
- [x] `Draw`
- [x] `Render`

### `get.go`

- [ ] `GetBold`
- [ ] `GetItalic`
- [ ] `GetUnderline`
- [ ] `GetUnderlineStyle`
- [ ] `GetUnderlineColor`
- [ ] `GetStrikethrough`
- [ ] `GetReverse`
- [ ] `GetBlink`
- [ ] `GetFaint`
- [ ] `GetForeground`
- [ ] `GetBackground`
- [ ] `GetWidth`
- [ ] `GetHeight`
- [ ] `GetAlign`
- [ ] `GetAlignHorizontal`
- [ ] `GetAlignVertical`
- [ ] `GetPadding`
- [ ] `GetPaddingTop`
- [ ] `GetPaddingRight`
- [ ] `GetPaddingBottom`
- [ ] `GetPaddingLeft`
- [ ] `GetPaddingChar`
- [ ] `GetHorizontalPadding`
- [ ] `GetVerticalPadding`
- [ ] `GetColorWhitespace`
- [ ] `GetMargin`
- [ ] `GetMarginTop`
- [ ] `GetMarginRight`
- [ ] `GetMarginBottom`
- [ ] `GetMarginLeft`
- [ ] `GetMarginChar`
- [ ] `GetHorizontalMargins`
- [ ] `GetVerticalMargins`
- [ ] `GetBorder`
- [ ] `GetBorderStyle`
- [ ] `GetBorderTop`
- [ ] `GetBorderRight`
- [ ] `GetBorderBottom`
- [ ] `GetBorderLeft`
- [ ] `GetBorderTopForeground`
- [ ] `GetBorderRightForeground`
- [ ] `GetBorderBottomForeground`
- [ ] `GetBorderLeftForeground`
- [ ] `GetBorderForegroundBlend`
- [ ] `GetBorderForegroundBlendOffset`
- [ ] `GetBorderTopBackground`
- [ ] `GetBorderRightBackground`
- [ ] `GetBorderBottomBackground`
- [ ] `GetBorderLeftBackground`
- [ ] `GetBorderTopWidth`
- [ ] `GetBorderTopSize`
- [ ] `GetBorderLeftSize`
- [ ] `GetBorderBottomSize`
- [ ] `GetBorderRightSize`
- [ ] `GetHorizontalBorderSize`
- [ ] `GetVerticalBorderSize`
- [ ] `GetInline`
- [ ] `GetMaxWidth`
- [ ] `GetMaxHeight`
- [ ] `GetTabWidth`
- [ ] `GetUnderlineSpaces`
- [ ] `GetStrikethroughSpaces`
- [ ] `GetHorizontalFrameSize`
- [ ] `GetVerticalFrameSize`
- [ ] `GetFrameSize`
- [ ] `GetTransform`
- [ ] `GetHyperlink`

### `set.go`

- [x] `Bold`
- [x] `Italic`
- [x] `Underline`
- [x] `UnderlineStyle`
- [ ] `UnderlineColor`
- [x] `Strikethrough`
- [x] `Reverse`
- [x] `Blink`
- [x] `Faint`
- [x] `Foreground`
- [x] `Background`
- [x] `Width`
- [x] `Height`
- [x] `Align`
- [x] `AlignHorizontal`
- [x] `AlignVertical`
- [x] `Padding`
- [x] `PaddingLeft`
- [x] `PaddingRight`
- [x] `PaddingTop`
- [x] `PaddingBottom`
- [x] `PaddingChar`
- [x] `ColorWhitespace`
- [x] `Margin`
- [x] `MarginLeft`
- [x] `MarginRight`
- [x] `MarginTop`
- [x] `MarginBottom`
- [x] `MarginBackground`
- [ ] `MarginChar`
- [x] `Border`
- [x] `BorderStyle`
- [x] `BorderTop`
- [x] `BorderRight`
- [x] `BorderBottom`
- [x] `BorderLeft`
- [ ] `BorderForeground`
- [x] `BorderTopForeground`
- [x] `BorderRightForeground`
- [x] `BorderBottomForeground`
- [x] `BorderLeftForeground`
- [ ] `BorderForegroundBlend`
- [ ] `BorderForegroundBlendOffset`
- [ ] `BorderBackground`
- [x] `BorderTopBackground`
- [x] `BorderRightBackground`
- [x] `BorderBottomBackground`
- [x] `BorderLeftBackground`
- [x] `Inline`
- [x] `MaxWidth`
- [x] `MaxHeight`
- [x] `TabWidth`
- [x] `UnderlineSpaces`
- [x] `StrikethroughSpaces`
- [x] `Transform`
- [x] `Hyperlink`

### `wrap.go`

- [x] `Wrap`
- [ ] `NewWrapWriter`
- [x] `Style`
- [x] `Link`
- [x] `Write`
- [x] `Close`

### `ansi_unix.go`

- [ ] `EnableLegacyWindowsANSI`

### `blending.go`

- [x] `Blend1D`
- [x] `Blend2D`


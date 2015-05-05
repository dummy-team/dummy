# Scss guidelines

## Text editor settings
- Tab size: 2 spaces
- Line size: < 120 signs
- Empty last line
- Remove trailing spaces

## Tree structure
```
css/
  |
  |– components/
  |   |– _buttons.scss     # Buttons
  |   |– _carousel.scss    # Carousel
  |   |– _cover.scss       # Cover
  |   |– _dropdown.scss    # Dropdown
  |   ...                  # Etc…
  |
  |– layout/
  |   |– _reset.scss       # Reset/normalize
  |   |– _grid.scss        # Grid system
  |   |– _global.scss      # Global
  |   |– _header.scss      # Header
  |   |– _footer.scss      # Footer
  |   |– _sidebar.scss     # Sidebar
  |   |– _forms.scss       # Forms
  |   ...                  # Etc…
  |
  |– utils/
  |   |– _variables.scss   # Sass Variables & typography rules
  |   |– _functions.scss   # Sass Functions
  |   |– _mixins.scss      # Sass Mixins
  |   |– _helpers.scss     # Class & placeholders helpers
  |
  `– main.scss             # primary Sass file
```
## Code Sample

```css

////
/// This is a poster comment.
/// It will apply annotations to all items from file.
/// @group example
/// @author Plou
/// @link http://sassdoc.com/annotations/ Annotation references
////

/// Sass Placeholder selector
/// Used as a base by buttons
/// @group buttons
/// @since 4.0
/// @author Inouit
/// @example scss
///   .button-blue {
///     @extend %button;
///   }
/// @ignore This is an example of SassDoc Comment
%button { @include mixin(3px); }

/// Styles buttons and link
/// Used for inner navigation links
/// @group buttons
/// @require %button
/// @todo replace `blue` by a more descriptive name
/// @ignore SassDoc don't generate documentation on selectors.

.button-blue {
  @extend %button;
  @include mixin(300px);

  display: relative; background-color: cyan;
  font-size: 1.3em; font-weight: 2;

  &:hover { background-color: DarkCyan; }
  &::before { content: ">"; display: block; }

  > h3 { color: white; }

  @media screen(max-width: $thin) { width: 100%; }

  .home & > h3 { color: red; }
}
```

## Responsive Breakpoints

| name      | default |
| --------- | ------: |
| $vw-thin   | 320     |
| $vw-small  | 480     |
| $vw-medium | 780     |
| $vw-large  | 1024    |
| $vw-huge   | 1200    |

## Font Weights

| name          | default |
| ------------- | ------: |
| $fw-light     | 300     |
| $fw-regular   | 400     |
| $fw-semibold  | 500     |
| $fw-bold      | 700     |

## Use
- Simple quotes
- Use `rem` unit when needed
- Lint files
- Source map
- Sass doc comments

## Don't
- `!important` whenever possible
- `#id` selector, no you don't. If needed use `[id='value']` instead (weighs as much as a class selector)
- Keep `extends` on first level and don't over use them, check the css output.


# CoffeeScript guidelines

## Text editor settings
- Tab size: 2 spaces
- Line size: < 120 signs
- Empty last line
- Remove trailing spaces

## Use
- Simple quotes
- Namespaced global variables
- Browserify
- Lint files
- Source map
- CoffeeDoc comments

## Don't
- Implicit return
- Nested functions without ~parentheses~
- Global variables

# Scss guideline

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
  |   |– _body.scss        # Body
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
%button { @include mixin(3px); }

.button|blue {
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
  | --------- | :-----: |
  | $thin     | 320     |
  | $small    | 480     |
  | $medium   | 780     |
  | $large    | 1024    |
  | $huge     | 1200    |

## Use
- Simple quotes
- Use `rem` unit when needed
- Lint files
- Source map
- Sass doc formated comments

## Don't
- `!important` whenever possible
- `#id` selector, no you don't. If needed use `[id='value']` instead (weighs as much as a class selector)
- Keep `extends` on first level and don't over use them, check the css output.

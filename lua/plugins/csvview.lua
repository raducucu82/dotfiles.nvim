return {
  {
    'hat0uma/csvview.nvim',
    config = function()
      require('csvview').setup({
        view = {
          --- minimum width of a column
          --- @type integer
          min_column_width = 5,

          --- spacing between columns
          --- @type integer
          spacing = 2,

          --- The display method of the delimiter
          --- "highlight" highlights the delimiter
          --- "border" displays the delimiter with `│`
          --- see `Features` section of the README.
          ---@type "highlight" | "border"
          display_mode = "border",
        },
      })
    end
  }
}

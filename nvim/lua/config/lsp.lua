local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- confirm completion
    ['<Enter>'] = cmp.mapping.confirm({select = true}),
  }),
})

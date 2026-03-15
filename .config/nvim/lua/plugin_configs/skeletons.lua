local skeld = require("skel-nvim.defaults")

local function get_file_basename()
    -- Get the current file's full path
    local filepath = vim.fn.expand('%:p')
    -- Get the filename without the extension
    local basename = vim.fn.fnamemodify(filepath, ':t:r')
    return basename
end
require("skel-nvim").setup{
  -- file pattern -> template mappings
  mappings = {
    ['*.c'] = "c.skel",
    ['*.h']   = "h.skel",
    ['*.cpp'] = "cpp.skel",
    ['*.hpp']   = "hpp.skel",
    ['*.vhd']   = "vhd.skel",
    ['*.v']   = "v.skel",
  },
  substitutions = {
    ['FILEBNAME']            = get_file_basename,
    ['FILENAME']             = skeld.get_filename,
    ['NAME']                 = skeld.get_author,
    ['DATE']                 = skeld.get_date,
    ['CPP_HDR_GUARD']        = skeld.get_cppheaderguard,
    ['CPP_TEST_HDR_GUARD']   = skeld.get_testheaderguard,
    ['CPP_HDR_INCLUDE']      = skeld.get_headerinclude,
    ['CLASS_NAME']           = skeld.get_classname2,
    ['NAMESPACE_OPEN']       = skeld.get_namespaceopen,
    ['NAMESPACE_CLOSE']      = skeld.get_namespaceclose,
  },
}

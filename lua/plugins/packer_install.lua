vim.cmd([[packadd packer.nvim]]) 
    
return require("packer").startup(function()                            
        -- Packer can manage itself  
        use("wbthomason/packer.nvim")

        -- Theme
        use("sainnhe/gruvbox-material")
end)

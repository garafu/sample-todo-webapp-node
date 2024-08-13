# ---------------------------------------------
# Virtual Netrowk
# ---------------------------------------------
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.project}-${var.environment}-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "web-snet"
    address_prefix = "10.0.1.0/24"
    security_group = azurerm_network_security_group.web.id
  }

  subnet {
    name           = "app-snet"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.app.id
  }

  subnet {
    name           = "db-snet"
    address_prefix = "10.0.3.0/24"
    security_group = azurerm_network_security_group.db.id
  }
}


# ---------------------------------------------
# Netrowk Security Group
# ---------------------------------------------
resource "azurerm_network_security_group" "web" {
  name                = "${var.project}-${var.environment}-vnet-web-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_group" "app" {
  name                = "${var.project}-${var.environment}-vnet-app-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_group" "db" {
  name                = "${var.project}-${var.environment}-vnet-db-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
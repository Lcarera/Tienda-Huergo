package com.huergo.catalogo

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils

import com.huergo.AccessRulesService
@Secured(['ROLE_ADMIN','ROLE_USER'])
class CatalogoController {

    AccessRulesService accessRulesService
    def index() {
    }

    def show() {
    
    }

    def save() {
    
    }

    def delete() {
    
    }

}
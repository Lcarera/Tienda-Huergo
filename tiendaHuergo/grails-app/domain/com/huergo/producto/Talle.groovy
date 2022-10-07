package com.huergo.producto

class Talle {

    String talle

    static constraints = {
        talle nullable:false
    }

     static namedQueries = {
        query { search ->
            if (!Boolean.valueOf(search.includeDeleted)) {
                eq('deleted', false)
            }

            if (search.containsKey('id')) {
                eq('id', search.id)
            }
        }
    }
}
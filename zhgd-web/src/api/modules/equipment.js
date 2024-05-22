import{postJson,post} from "@/api/axios"

export function save(params){
    return postJson('Equipment/save',params)
}

export function list(params){
    return post('Equipment/list',params)
}

export function deleteByIds(params){
    return post('Equipment/deleteByIds',params)
}

export function dataChange(params){
    return post('Equipment/dataChange',params)
}

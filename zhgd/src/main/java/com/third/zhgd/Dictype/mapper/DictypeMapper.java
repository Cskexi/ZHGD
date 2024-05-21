package com.third.zhgd.Dictype.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.third.zhgd.Dictype.entity.Dictype;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 * 字典类型表 Mapper 接口
 * </p>
 *
 * @author Csk
 * @since 2024-05-14
 */
public interface DictypeMapper extends BaseMapper<Dictype> {
    @Select("select dictype.* from tb_dictype dictype where dictype.name like '%${name}%' ")
    Page<Dictype> getPageByUsername(@Param("page")Page<Dictype> page, @Param("name") String name);

}

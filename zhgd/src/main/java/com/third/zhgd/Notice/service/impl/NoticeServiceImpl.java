package com.third.zhgd.Notice.service.impl;

import com.third.zhgd.other.utils.DateTool;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.third.zhgd.Notice.mapper.NoticeMapper;
import com.third.zhgd.Notice.entity.Notice;
import com.third.zhgd.Notice.service.NoticeService;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
/**
* <p>
    *  服务层实现类
    * </p>
*
* @author Csk
* @since 2024-05-21
*/
@Service
public class NoticeServiceImpl extends ServiceImpl<NoticeMapper,Notice> implements NoticeService {

    @Override
    public Boolean addOrUpdate(Notice notice) {
        if(StringUtils.isBlank(notice.getId())){
            //add
            notice.setCreateTime(DateTool.getCurrTime());
            this.save(notice);
        }else{
            //update
            this.updateById(notice);
        }
        return true;
    }

    @Override
    public void deleteByIds(String ids) {
        List<String> listIds = new ArrayList<>();
        String[] aryIds = ids.split(",");
        for(String id: aryIds){
            listIds.add(id);
        }
        this.removeByIds(listIds);
    }


    @Override
    public List<Notice> list() {
        return this.list();
    }


    @Override
    public Page<Notice> page(Integer pageNum,Integer pageSize) {
        Page<Notice> page = new Page(pageNum,pageSize);

        return this.page(page);
    }

}
package com.third.zhgd.Notice.controller;

import com.third.zhgd.other.utils.Result;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMethod;
import com.third.zhgd.Notice.entity.Notice;
import com.third.zhgd.Notice.service.NoticeService;

import org.springframework.web.bind.annotation.RestController;


/**
 * <p>
 *  前端控制器,表的注释
 * </p>
 *
 * @author Csk
 * @since 2024-05-21
 */
@RestController
@RequestMapping("/Notice/")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    @ApiOperation(value = "保存修改Notice信息")
    @RequestMapping(method = RequestMethod.POST, value = "/save")
    public Result addOrUpdate(@RequestBody Notice notice) {
        Result result = new Result();
        //交给业务去处理，service
        noticeService.addOrUpdate(notice);
        return result;
    }

    @ApiOperation(value = "批量删除记录")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "ids",required = true,paramType = "query",value = "需要删除的多个id，用逗号,隔开")
    })
    @RequestMapping(method = RequestMethod.POST,value = "/deleteByIds")
    public Result deleteByIds(String ids) {
        Result result = new Result();
        noticeService.deleteByIds(ids);
        result.success("删除成功");
        return result;
    }


    @ApiOperation(value = "查询所有记录")
    @RequestMapping(method = RequestMethod.POST,value = "/list")
    public Result list(String state){
        Result result = new Result();
        result.success("获取list成功");
        result.setData(noticeService.list(state));
        return result;
    }

    @ApiOperation(value = "分页获取记录")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "pageNum",required = true,paramType = "query",value = "当前页码"),
        @ApiImplicitParam(name = "pageSize",required = true,paramType = "query",value = "每页记录数")
    })
    @RequestMapping(method = RequestMethod.POST,value = "/page")
    public Result page( Integer pageNum,Integer pageSize,String state){
        Result result = new Result();
        result.success("分页获取成功");
        result.setData(noticeService.page(pageNum,pageSize,state));
        return result;
    }

}

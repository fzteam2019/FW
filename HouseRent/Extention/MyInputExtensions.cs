using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;

namespace System.Web.Mvc
{

    public static class MyInputExtensions
    {
        public static MvcHtmlString Input(this HtmlHelper htmlHelper, string name)
        {
            TagBuilder tagBuilder = new TagBuilder("input");//设置标签类型为input
            tagBuilder.Attributes.Add("type", "file");//为标签添加type属性及值
            tagBuilder.Attributes.Add("name", name);//为标签添加name属性及值
            tagBuilder.Attributes.Add("multiple", "multiple");
            tagBuilder.Attributes.Add("accept", "image/x-png,image/gif,image/jpeg,image/bmp");//为标签添加accept值，图片类型设置为“image/x-png,image/gif,image/jpeg,image/bmp”
            tagBuilder.GenerateId(name);//为标签生成Id，name参数代码Id的值
            //创建经过HTML加密的字符串
            //TagRenderMode.SelfClosing枚举值代表当前标签是自动关闭的
            return MvcHtmlString.Create(tagBuilder.ToString(TagRenderMode.SelfClosing));
        }

        public static MvcHtmlString InputFor<TModel, TProperty>(this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression)
        {
            string modelName = ExpressionHelper.GetExpressionText(expression);//从Lambda表达式中获取模型对应属性的名称
            TagBuilder tagBuilder = new TagBuilder("input");//设置标签类型为input
            tagBuilder.Attributes.Add("type", "file");//为标签添加type属性及值
            tagBuilder.Attributes.Add("name", modelName);//为标签添加name属性及值
            tagBuilder.Attributes.Add("multiple", "multiple");
            tagBuilder.Attributes.Add("accept", "image/x-png,image/gif,image/jpeg,image/bmp");//为标签添加accept值，图片类型设置为“image/x-png,image/gif,image/jpeg,image/bmp”
            tagBuilder.GenerateId(modelName);//为标签生成Id，name参数代码Id的值
            //创建经过HTML加密的字符串
            //TagRenderMode.SelfClosing枚举值代表当前标签是自动关闭的
            return MvcHtmlString.Create(tagBuilder.ToString(TagRenderMode.SelfClosing));
        }
    }
}
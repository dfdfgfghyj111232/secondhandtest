package com.ctgu.jiujiu_usedcar.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.io.File;

/**
 * 资源映射路径
 */
@Configuration
public class UploadImageConfigurer implements WebMvcConfigurer {

    /** 上传地址 */
    @Value("${file.upload.path}")
    private String filePath;
    /** 显示相对地址 */
    @Value("${file.upload.path.relative}")
    private String fileRelativePath;

    private String getAbsolutePath(String path) {
        if (path.startsWith("~" + File.separator)) {
            return "file:" + System.getProperty("user.home") + path.substring(1);
        }
        return "file:" + path;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 处理 ~ 符号代表的用户主目录
        String absolutePath = getAbsolutePath(filePath);

        registry.addResourceHandler(fileRelativePath)
                .addResourceLocations(absolutePath);
        // 这里优化了一下：如果你的所有图片都保存在fileRelativePath定义的路径下，这行就不需要了
        // registry.addResourceHandler("/images/**")
        //         .addResourceLocations("file:/images/");
        WebMvcConfigurer.super.addResourceHandlers(registry);
    }
}

/*registry.addResourceHandler("/images/**").
                addResourceLocations("file:/images");
* /images/**------>>相当于>>file:/C://images
* /images/xxx.jps------>>相当于>>file:/C://images/xxx.jpg
*
* */
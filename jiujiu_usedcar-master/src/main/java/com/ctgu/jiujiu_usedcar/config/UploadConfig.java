package com.ctgu.jiujiu_usedcar.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
@Component
public class UploadConfig {

    // 使用@Value来注入配置文件里的路径
    @Value("${file.upload.path}")
    private String filePath="~/secondhand/loadimages/images/";

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getCompleteFilepath() {
        return completeFilepath;
    }

    public void setCompleteFilepath(String completeFilepath) {
        this.completeFilepath = completeFilepath;
    }
    private String completeFilepath;

    // 你的其他getter和setter方法

    // 修复后的 uploadFile 方法
    public void uploadFile(MultipartFile file) {
        String originalFilename = file.getOriginalFilename();
        System.out.println("初始的文件名: " + originalFilename);
        String filename = new RandomStringUtil().getRandomString(18) + "-" + originalFilename;

        System.out.println("添加随机字符串后的文件名：" + filename);

        // 获取上传文件保存路径
        String path = getUploadPath() + "rotPhoto/";
        File filepath = new File(path, filename);

        System.out.println("文件上传的路径：" + path);

        // 确保文件夹路径存在
        if (!filepath.getParentFile().exists()) {
            filepath.getParentFile().mkdirs();
        }

        // 尝试写入文件
        try {
            file.transferTo(filepath);
            System.out.println("文件完整路径: " + filepath.getAbsolutePath());
            this.completeFilepath = "/secondhand/images/rotPhoto/" + filename;
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("写入失败");
        }
    }

    public String getUploadPath() {
        System.out.println(filePath);
        // 如果路径是相对路径就转换成绝对路径
        if (this.filePath.startsWith("~" + File.separator)) {
            return System.getProperty("user.home") + this.filePath.substring(1);
        } else {
            return this.filePath;
        }
    }
}

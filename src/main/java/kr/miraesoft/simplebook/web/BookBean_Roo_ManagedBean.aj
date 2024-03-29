// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package kr.miraesoft.simplebook.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import javax.faces.convert.DateTimeConverter;
import javax.faces.validator.LengthValidator;
import kr.miraesoft.simplebook.domain.Book;
import kr.miraesoft.simplebook.web.BookBean;
import org.primefaces.component.calendar.Calendar;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.inputtextarea.InputTextarea;
import org.primefaces.component.message.Message;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;

privileged aspect BookBean_Roo_ManagedBean {
    
    declare @type: BookBean: @ManagedBean(name = "bookBean");
    
    declare @type: BookBean: @SessionScoped;
    
    private String BookBean.name = "Books";
    
    private Book BookBean.book;
    
    private List<Book> BookBean.allBooks;
    
    private boolean BookBean.dataVisible = false;
    
    private List<String> BookBean.columns;
    
    private HtmlPanelGrid BookBean.createPanelGrid;
    
    private HtmlPanelGrid BookBean.editPanelGrid;
    
    private HtmlPanelGrid BookBean.viewPanelGrid;
    
    private boolean BookBean.createDialogVisible = false;
    
    @PostConstruct
    public void BookBean.init() {
        columns = new ArrayList<String>();
        columns.add("name");
        columns.add("author");
        columns.add("publishDate");
    }
    
    public String BookBean.getName() {
        return name;
    }
    
    public List<String> BookBean.getColumns() {
        return columns;
    }
    
    public List<Book> BookBean.getAllBooks() {
        return allBooks;
    }
    
    public void BookBean.setAllBooks(List<Book> allBooks) {
        this.allBooks = allBooks;
    }
    
    public String BookBean.findAllBooks() {
        allBooks = Book.findAllBooks();
        dataVisible = !allBooks.isEmpty();
        return null;
    }
    
    public boolean BookBean.isDataVisible() {
        return dataVisible;
    }
    
    public void BookBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid BookBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void BookBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid BookBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void BookBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid BookBean.getViewPanelGrid() {
        if (viewPanelGrid == null) {
            viewPanelGrid = populateViewPanel();
        }
        return viewPanelGrid;
    }
    
    public void BookBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid BookBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText nameCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nameCreateOutput.setId("nameCreateOutput");
        nameCreateOutput.setValue("Name: * ");
        htmlPanelGrid.getChildren().add(nameCreateOutput);
        
        InputTextarea nameCreateInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        nameCreateInput.setMaxHeight(100);
        nameCreateInput.setId("nameCreateInput");
        nameCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{bookBean.book.name}", String.class));
        LengthValidator nameCreateInputValidator = new LengthValidator();
        nameCreateInputValidator.setMinimum(2);
        nameCreateInputValidator.setMaximum(50);
        nameCreateInput.addValidator(nameCreateInputValidator);
        nameCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(nameCreateInput);
        
        Message nameCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        nameCreateInputMessage.setId("nameCreateInputMessage");
        nameCreateInputMessage.setFor("nameCreateInput");
        nameCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(nameCreateInputMessage);
        
        HtmlOutputText authorCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        authorCreateOutput.setId("authorCreateOutput");
        authorCreateOutput.setValue("Author: * ");
        htmlPanelGrid.getChildren().add(authorCreateOutput);
        
        InputText authorCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        authorCreateInput.setId("authorCreateInput");
        authorCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{bookBean.book.author}", String.class));
        LengthValidator authorCreateInputValidator = new LengthValidator();
        authorCreateInputValidator.setMaximum(5);
        authorCreateInput.addValidator(authorCreateInputValidator);
        authorCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(authorCreateInput);
        
        Message authorCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        authorCreateInputMessage.setId("authorCreateInputMessage");
        authorCreateInputMessage.setFor("authorCreateInput");
        authorCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(authorCreateInputMessage);
        
        HtmlOutputText publishDateCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        publishDateCreateOutput.setId("publishDateCreateOutput");
        publishDateCreateOutput.setValue("Publish Date:   ");
        htmlPanelGrid.getChildren().add(publishDateCreateOutput);
        
        Calendar publishDateCreateInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        publishDateCreateInput.setId("publishDateCreateInput");
        publishDateCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{bookBean.book.publishDate}", Date.class));
        publishDateCreateInput.setNavigator(true);
        publishDateCreateInput.setEffect("slideDown");
        publishDateCreateInput.setPattern("dd/MM/yyyy");
        publishDateCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(publishDateCreateInput);
        
        Message publishDateCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        publishDateCreateInputMessage.setId("publishDateCreateInputMessage");
        publishDateCreateInputMessage.setFor("publishDateCreateInput");
        publishDateCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(publishDateCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid BookBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText nameEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nameEditOutput.setId("nameEditOutput");
        nameEditOutput.setValue("Name: * ");
        htmlPanelGrid.getChildren().add(nameEditOutput);
        
        InputTextarea nameEditInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        nameEditInput.setMaxHeight(100);
        nameEditInput.setId("nameEditInput");
        nameEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{bookBean.book.name}", String.class));
        LengthValidator nameEditInputValidator = new LengthValidator();
        nameEditInputValidator.setMinimum(2);
        nameEditInputValidator.setMaximum(50);
        nameEditInput.addValidator(nameEditInputValidator);
        nameEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(nameEditInput);
        
        Message nameEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        nameEditInputMessage.setId("nameEditInputMessage");
        nameEditInputMessage.setFor("nameEditInput");
        nameEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(nameEditInputMessage);
        
        HtmlOutputText authorEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        authorEditOutput.setId("authorEditOutput");
        authorEditOutput.setValue("Author: * ");
        htmlPanelGrid.getChildren().add(authorEditOutput);
        
        InputText authorEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        authorEditInput.setId("authorEditInput");
        authorEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{bookBean.book.author}", String.class));
        LengthValidator authorEditInputValidator = new LengthValidator();
        authorEditInputValidator.setMaximum(5);
        authorEditInput.addValidator(authorEditInputValidator);
        authorEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(authorEditInput);
        
        Message authorEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        authorEditInputMessage.setId("authorEditInputMessage");
        authorEditInputMessage.setFor("authorEditInput");
        authorEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(authorEditInputMessage);
        
        HtmlOutputText publishDateEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        publishDateEditOutput.setId("publishDateEditOutput");
        publishDateEditOutput.setValue("Publish Date:   ");
        htmlPanelGrid.getChildren().add(publishDateEditOutput);
        
        Calendar publishDateEditInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        publishDateEditInput.setId("publishDateEditInput");
        publishDateEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{bookBean.book.publishDate}", Date.class));
        publishDateEditInput.setNavigator(true);
        publishDateEditInput.setEffect("slideDown");
        publishDateEditInput.setPattern("dd/MM/yyyy");
        publishDateEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(publishDateEditInput);
        
        Message publishDateEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        publishDateEditInputMessage.setId("publishDateEditInputMessage");
        publishDateEditInputMessage.setFor("publishDateEditInput");
        publishDateEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(publishDateEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid BookBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText nameLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nameLabel.setId("nameLabel");
        nameLabel.setValue("Name:   ");
        htmlPanelGrid.getChildren().add(nameLabel);
        
        InputTextarea nameValue = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        nameValue.setMaxHeight(100);
        nameValue.setId("nameValue");
        nameValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{bookBean.book.name}", String.class));
        nameValue.setReadonly(true);
        nameValue.setDisabled(true);
        htmlPanelGrid.getChildren().add(nameValue);
        
        HtmlOutputText authorLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        authorLabel.setId("authorLabel");
        authorLabel.setValue("Author:   ");
        htmlPanelGrid.getChildren().add(authorLabel);
        
        HtmlOutputText authorValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        authorValue.setId("authorValue");
        authorValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{bookBean.book.author}", String.class));
        htmlPanelGrid.getChildren().add(authorValue);
        
        HtmlOutputText publishDateLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        publishDateLabel.setId("publishDateLabel");
        publishDateLabel.setValue("Publish Date:   ");
        htmlPanelGrid.getChildren().add(publishDateLabel);
        
        HtmlOutputText publishDateValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        publishDateValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{bookBean.book.publishDate}", Date.class));
        DateTimeConverter publishDateValueConverter = (DateTimeConverter) application.createConverter(DateTimeConverter.CONVERTER_ID);
        publishDateValueConverter.setPattern("dd/MM/yyyy");
        publishDateValue.setConverter(publishDateValueConverter);
        htmlPanelGrid.getChildren().add(publishDateValue);
        
        return htmlPanelGrid;
    }
    
    public Book BookBean.getBook() {
        if (book == null) {
            book = new Book();
        }
        return book;
    }
    
    public void BookBean.setBook(Book book) {
        this.book = book;
    }
    
    public String BookBean.onEdit() {
        return null;
    }
    
    public boolean BookBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void BookBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String BookBean.displayList() {
        createDialogVisible = false;
        findAllBooks();
        return "book";
    }
    
    public String BookBean.displayCreateDialog() {
        book = new Book();
        createDialogVisible = true;
        return "book";
    }
    
    public String BookBean.persist() {
        String message = "";
        if (book.getId() != null) {
            book.merge();
            message = "Successfully updated";
        } else {
            book.persist();
            message = "Successfully created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialog.hide()");
        context.execute("editDialog.hide()");
        
        FacesMessage facesMessage = new FacesMessage(message);
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllBooks();
    }
    
    public String BookBean.delete() {
        book.remove();
        FacesMessage facesMessage = new FacesMessage("Successfully deleted");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllBooks();
    }
    
    public void BookBean.reset() {
        book = null;
        createDialogVisible = false;
    }
    
    public void BookBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}
